@echo off
setlocal enabledelayedexpansion

:: Rastgele 8 haneli bir sayı oluştur
set "newNumber="
set /a "randNum=!random! %% 90000000 + 10000000"

:: Sayıyı stringe dönüştür
set "newNumberStr=%randNum%"

:: Rastgele bir GUID oluştur
set "characters=ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
set "newGuid="
set /a "guidLength=!random! %% 17 + 16"

for /l %%i in (1,1,%guidLength%) do (
    set /a "randNum=!random! %% 36"
    for /l %%j in (!randNum!,1,!randNum!) do (
        for %%k in (!characters:~%%j,1!) do set "newGuid=!newGuid!!k"
    )
)

:: Değişiklikleri kaydet
set "newProductId=XCTRAILER!newNumberStr!"
set "newMachineGuid=XCTRAILER!newNumberStr!"

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "ProductId" /t REG_SZ /d "!newProductId!" /f
reg add "HKLM\SOFTWARE\Microsoft\Cryptography" /v "MachineGuid" /t REG_SZ /d "!newMachineGuid!" /f
