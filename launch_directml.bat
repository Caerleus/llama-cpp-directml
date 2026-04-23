@echo off
setlocal ENABLEDELAYEDEXPANSION

set "BASE_DIR=%~dp0"
set "LLAMA_BIN=%BASE_DIR%llama-server.exe"
set "MODEL_DIR=%BASE_DIR%models"

echo ============================================================
echo   llama.cpp DirectML Launcher - Advanced Edition
echo ============================================================
echo.

:: 1) MODEL SELECTION
set /a index=0
for %%f in ("%MODEL_DIR%\*.gguf") do (
    set /a index+=1
    set "model[!index!]=%%f"
    set "fname=%%~nxf"
    echo   !index!] !fname!
)

if %index%==0 (
    echo [!] ERROR: No models found in /models folder.
    pause
    exit /b
)

echo.
set /p CHOICE=Select a model (number): 
set "MODEL_FILE=!model[%CHOICE%]!"
for %%i in ("!MODEL_FILE!") do set "MODEL_NAME=%%~nxi"

:: 2) HARDWARE & CONTEXT SETTINGS
echo.
echo --- Configuration Settings ---

set /p USER_THREADS=1. CPU Threads (default 4): 
if "%USER_THREADS%"=="" (set "THREADS=4") else (set "THREADS=%USER_THREADS%")

set /p USER_LAYERS=2. GPU Layers (for 4GB VRAM try 20-28): 
if "%USER_LAYERS%"=="" (set "G_LAYERS=22") else (set "G_LAYERS=%USER_LAYERS%")

set /p USER_CTX=3. Context Size (default 4096, max depends on VRAM): 
if "%USER_CTX%"=="" (set "CTX=4096") else (set "CTX=%USER_CTX%")

set /p USER_PORT=4. Server Port (default 11434): 
if "%USER_PORT%"=="" (set "PORT=11434") else (set "PORT=%USER_PORT%")

:: 3) SUMMARY MESSAGE
echo.
echo ============================================================
echo   READY TO LAUNCH
echo ============================================================
echo   MODEL:    %MODEL_NAME%
echo   THREADS:  %THREADS% Core(s)
echo   LAYERS:   %G_LAYERS% (DirectML Acceleration)
echo   CONTEXT:  %CTX% Tokens
echo   PORT:     %PORT%
echo   URL:      http://127.0.0.1:%PORT%
echo ============================================================
echo.
echo Press any key to start the server...
pause > nul

"%LLAMA_BIN%" -m "%MODEL_FILE%" -c %CTX% -t %THREADS% -ngl %G_LAYERS% --port %PORT%

pause