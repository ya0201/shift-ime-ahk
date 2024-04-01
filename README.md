# shift-ime-ahk

## 概要

左右 shift キーの空打ちで IME を OFF/ON する AutoHotKey スクリプトです。

* 左 shift キーの空打ちで IME を「英数」に切り替え
* 右 shift キーの空打ちで IME を「かな」に切り替え
* shift キーを押している間に他のキーを打つと通常の shift キーとして動作

## 動作環境

* Windows10

## 使い方

システムにautohotkeyを入れ、shift-ime-ahk.ahkをcompileすることで出来る shift-ime-ahk.exe をスタートアップに登録します。

終了する場合はタスクトレイのアイコンを右クリックし、「終了」をクリックしてください。

アンインストールは shift-ime-ahk.exe を削除するだけで OK です。

## JetBrains 製の IDE で使う場合は Tool Buttons をオンに

IntelliJ IDEA など JetBrains 製の IDE をお使いの方は「上部メニューバー　＞　View　＞　Tool Buttons」をオンにしてください。

オフのまま使うと Alt キーを離した際に shift-ime-ahk.exe がエラー終了します。
