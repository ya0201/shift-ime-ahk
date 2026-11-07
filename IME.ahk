#Requires AutoHotkey v2.0

; IME制御用関数群。AutoHotkey v2 対応版。

IME_GET(WinTitle := "A")
{
    return IME_SendMessage(0x005, 0, WinTitle)
}

IME_SET(SetSts, WinTitle := "A")
{
    return IME_SendMessage(0x006, SetSts, WinTitle)
}

IME_GetConvMode(WinTitle := "A")
{
    return IME_SendMessage(0x001, 0, WinTitle)
}

IME_SetConvMode(ConvMode, WinTitle := "A")
{
    return IME_SendMessage(0x002, ConvMode, WinTitle)
}

IME_GetSentenceMode(WinTitle := "A")
{
    return IME_SendMessage(0x003, 0, WinTitle)
}

IME_SetSentenceMode(SentenceMode, WinTitle := "A")
{
    return IME_SendMessage(0x004, SentenceMode, WinTitle)
}

IME_SendMessage(command, parameter, WinTitle)
{
    hwnd := IME_GetTargetHwnd(WinTitle)
    imeHwnd := DllCall("imm32\ImmGetDefaultIMEWnd", "Ptr", hwnd, "Ptr")

    return DllCall("SendMessage", "Ptr", imeHwnd, "UInt", 0x0283,
        "Ptr", command, "Ptr", parameter, "Ptr")
}

IME_GetTargetHwnd(WinTitle)
{
    hwnd := WinExist(WinTitle)
    if !WinActive(WinTitle)
        return hwnd

    ptrSize := A_PtrSize
    guiThreadInfoSize := 8 + (ptrSize * 6) + 16
    guiThreadInfo := Buffer(guiThreadInfoSize, 0)
    NumPut("UInt", guiThreadInfoSize, guiThreadInfo, 0)

    if DllCall("GetGUIThreadInfo", "UInt", 0, "Ptr", guiThreadInfo)
        return NumGet(guiThreadInfo, 8 + ptrSize, "Ptr")

    return hwnd
}

IME_GetConverting(WinTitle := "A", ConvCls := "", CandCls := "")
{
    ConvCls .= (ConvCls ? "|" : "")
        . "ATOK\d+CompStr|imejpstcnv\d+|WXGIMEConv|SKKIME\d+\.*\d+UCompStr|MSCTFIME Composition"
    CandCls .= (CandCls ? "|" : "")
        . "ATOK\d+Cand|imejpstCandList\d+|imejpstcand\d+|mscandui\d+\.candidate|WXGIMECand|SKKIME\d+\.*\d+UCand"

    hwnd := IME_GetTargetHwnd(WinTitle)
    pid := WinGetPID("ahk_id " hwnd)
    titleMatchMode := A_TitleMatchMode
    SetTitleMatchMode("RegEx")

    try {
        return WinExist("ahk_class " CandCls " ahk_pid " pid) ? 2
            : WinExist("ahk_class GoogleJapaneseInputCandidateWindow") ? 2
            : WinExist("ahk_class " ConvCls " ahk_pid " pid) ? 1
            : 0
    } finally {
        SetTitleMatchMode(titleMatchMode)
    }
}
