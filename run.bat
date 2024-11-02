@echo off
setlocal

:: BlumPayloadGenerator başlatma
if not exist "BlumPayloadGenerator" (
    echo BlumPayloadGenerator directory not found. Please ensure it is cloned.
    pause
    exit /b
)

cd BlumPayloadGenerator
if exist "start.bat" (
    echo Starting custom payload server...
    start "Custom Payload Server" start.bat
) else (
    echo start.bat not found in BlumPayloadGenerator directory.
    pause
    exit /b
)

cd ..

:: main.py başlatma
echo Starting main.py...
python main.py

:: Son mesajlar
echo Done.
pause
endlocal
