#Requires AutoHotkey v2.0
#SingleInstance Force

; 左右 Shift キーの空打ちで IME の OFF/ON を切り替える
;
; 左 Shift キーの空打ちで IME を「英数」に切り替え
; 右 Shift キーの空打ちで IME を「かな」に切り替え
; Shift キーを押している間に他のキーを打つと通常の Shift キーとして動作

#Include "IME.ahk"

; Razer Synapseなど、キーカスタマイズ系のツールを併用しているときのエラー対策
#MaxHotkeysPerInterval 350
#InstallKeybdHook
#UseHook

SetKeyDelay(0)

~LShift Up::
{
    if (A_PriorKey = "LShift")
        IME_SET(0)
}

~RShift Up::
{
    if (A_PriorKey = "RShift")
        IME_SET(1)
}

~LCtrl Up::
{
    if (A_PriorKey = "LControl" || A_PriorKey = "LCtrl")
        Send("{Esc}")
}

; Applications you want to disable emacs-like keybindings.
is_target()
{
    return WinActive("ahk_class ConsoleWindowClass")
        || WinActive("ahk_class MEADOW")
        || WinActive("ahk_class cygwin/x X rl-xterm-XTerm-0")
        || WinActive("ahk_class MozillaUIWindowClass")
        || WinActive("ahk_class VMwareUnityHostWndClass")
        || WinActive("ahk_class Vim")
}

^p::
{
    if is_target()
        Send(A_ThisHotkey)
    else
        Send("{Up}")
}

^n::
{
    if is_target()
        Send(A_ThisHotkey)
    else
        Send("{Down}")
}

^a::
{
    if is_target()
        Send(A_ThisHotkey)
    else
        Send("{Home}")
}

+^a::
{
    if is_target()
        Send(A_ThisHotkey)
    else
        Send("^a")
}

^e::
{
    if is_target()
        Send(A_ThisHotkey)
    else
        Send("{End}")
}
