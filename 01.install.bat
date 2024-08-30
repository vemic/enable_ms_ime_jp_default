:: ------------------------------------------------------
:: Microsoft IMEの日本語入力をデフォルトで有効にする
:: author: @vemic
:: date: 2024-08-30
:: version: 1.0
:: ------------------------------------------------------

@echo off
:: 管理者権限の確認
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo 管理者権限で再実行しています...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~dp0%~nx0' -Verb RunAs"
    exit /b
)

set key="HKCU\Software\Microsoft\InputMethod\Settings\IMEJP"
set value="Enable"
set data=1

:: レジストリキーの値を設定
reg add %key% /v %value% /t REG_DWORD /d %data% /f

:: IMEを再起動して設定を反映
taskkill /IM "ctfmon.exe" /F
start "" "ctfmon.exe"
echo ctfmon.exeの再起動が完了しました。

echo 設定が完了しました。
echo 終了するには何かキーを押してください。
pause >nul
