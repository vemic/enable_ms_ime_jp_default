:: ------------------------------------------------------
:: Microsoft IME�̓��{����͂��f�t�H���g�ŗL���ɂ���
:: author: @vemic
:: date: 2024-08-30
:: version: 1.0
:: ------------------------------------------------------

@echo off
:: �Ǘ��Ҍ����̊m�F
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo �Ǘ��Ҍ����ōĎ��s���Ă��܂�...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~dp0%~nx0' -Verb RunAs"
    exit /b
)

set key="HKCU\Software\Microsoft\InputMethod\Settings\IMEJP"
set value="Enable"
set data=1

:: ���W�X�g���L�[�̒l��ݒ�
reg add %key% /v %value% /t REG_DWORD /d %data% /f

:: IME���ċN�����Đݒ�𔽉f
taskkill /IM "ctfmon.exe" /F
start "" "ctfmon.exe"
echo ctfmon.exe�̍ċN�����������܂����B

echo �ݒ肪�������܂����B
echo �I������ɂ͉����L�[�������Ă��������B
pause >nul
