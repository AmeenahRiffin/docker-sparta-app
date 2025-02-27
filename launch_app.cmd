@echo off

REM This script will automatically build and run the docker container for the Sparta app

cd "Sparta Database"

echo Verifying Database...
REM Check if container already exists and is running
docker-compose ps | findstr "Up" > nul
if %errorlevel% equ 0 (
    echo Database is already running!
) else (
    REM Start the database container
    docker-compose up -d
)

cd "..\Sparta App"

echo Verifying App...
REM Check if container already exists and is running
docker-compose ps | findstr "Up" > nul
if %errorlevel% equ 0 (
    echo App is already running!
) else (
    REM Start the app container
    docker-compose up -d
)
echo Waiting for app to start...
timeout /t 10 /nobreak > nul

echo Opening application in default browser...
REM Open localhost:3000 in browser
start http://localhost:3000

echo ===============================
echo App launched successfully!
echo Access the app at: http://localhost:3000
echo ===============================

pause