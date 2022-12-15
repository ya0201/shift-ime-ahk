; 左右 Shift キーの空打ちで IME の OFF/ON を切り替える
;
; 左 Shift キーの空打ちで IME を「英数」に切り替え
; 右 Shift キーの空打ちで IME を「かな」に切り替え
; Shift キーを押している間に他のキーを打つと通常の Shift キーとして動作
;
; Author:     karakaram   http://www.karakaram.com/alt-ime-on-off

#Include IME.ahk

; Razer Synapseなど、キーカスタマイズ系のツールを併用しているときのエラー対策
#MaxHotkeysPerInterval 350

; 主要なキーを HotKey に設定し、何もせずパススルーする
*~a::
*~b::
*~c::
*~d::
*~e::
*~f::
*~g::
*~h::
*~i::
*~j::
*~k::
*~l::
*~m::
*~n::
*~o::
*~p::
*~q::
*~r::
*~s::
*~t::
*~u::
*~v::
*~w::
*~x::
*~y::
*~z::
*~1::
*~2::
*~3::
*~4::
*~5::
*~6::
*~7::
*~8::
*~9::
*~0::
*~F1::
*~F2::
*~F3::
*~F4::
*~F5::
*~F6::
*~F7::
*~F8::
*~F9::
*~F10::
*~F11::
*~F12::
*~`::
*~~::
*~!::
*~@::
*~#::
*~$::
*~%::
*~&::
*~*::
*~(::
*~)::
*~-::
*~_::
*~=::
*~+::
*~[::
*~{::
*~]::
*~}::
*~\::
*~|::
*~;::
*~'::
*~"::
*~,::
*~<::
*~.::
*~>::
*~/::
*~?::
*~Esc::
*~Tab::
*~Space::
*~Left::
*~Right::
*~Up::
*~Down::
*~Enter::
*~PrintScreen::
*~Delete::
*~Home::
*~End::
*~PgUp::
*~PgDn::
    Return

; 上部メニューがアクティブになるのを抑制
 *~LShift::Send {Blind}{vk07}
 *~RShift::Send {Blind}{vk07}
 *~LCtrl::Send {Blind}{vk07}

; 左 Shift 空打ちで IME を OFF
LShift up::
    if (A_PriorHotkey == "*~LShift")
    {
        IME_SET(0)
    }
    Return

; 右 Shift 空打ちで IME を ON
RShift up::
    if (A_PriorHotkey == "*~RShift")
    {
        IME_SET(1)
    }
    Return

; 左 Ctrl 空打ちで Esc
LCtrl up::
    if (A_PriorHotkey == "*~LCtrl")
    {
        Send {Esc}
    }
    Return

;;
;; An autohotkey script that provides gtk-emacs-key-theme like keybinding on Windows
;; forked from https://github.com/usi3/emacs.ahk
;;
#InstallKeybdHook
#UseHook

; The following line is a contribution of NTEmacs wiki http://www49.atwiki.jp/ntemacs/pages/20.html
SetKeyDelay 0

; Applications you want to disable emacs-like keybindings
; (Please comment out applications you don't use)
is_target()
{
  IfWinActive,ahk_class ConsoleWindowClass ; Cygwin
    Return 1
  IfWinActive,ahk_class MEADOW ; Meadow
    Return 1
  IfWinActive,ahk_class cygwin/x X rl-xterm-XTerm-0
    Return 1
  IfWinActive,ahk_class MozillaUIWindowClass ; keysnail on Firefox
    Return 1
  ; Avoid VMwareUnity with AutoHotkey
  IfWinActive,ahk_class VMwareUnityHostWndClass
    Return 1
  IfWinActive,ahk_class Vim ; GVIM
    Return 1
;  IfWinActive,ahk_class SWT_Window0 ; Eclipse
;    Return 1
;   IfWinActive,ahk_class Xming X
;     Return 1
;   IfWinActive,ahk_class SunAwtFrame
;     Return 1
;   IfWinActive,ahk_class Emacs ; NTEmacs
;     Return 1
;   IfWinActive,ahk_class XEmacs ; XEmacs on Cygwin
;     Return 1
  Return 0
}

;
; <ctrl>p
; move cursor up
;
^p::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send {Up}
  Return

;
; <ctrl>n
; move cursor down
;
^n::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send {Down}
  Return

;
; <ctrl>a
; move cursor beginning of current line
;
^a::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send {Home}
  Return

;
; <shift><ctrl>a
; select all
;
+^a::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send ^a
  Return

;
; <ctrl>e
; move cursor end of current line
;
^e::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send {End}
  Return
