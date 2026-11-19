@echo off
echo ===================================================
echo   LeafGuard AI - Starting Full-Stack Application
echo ===================================================
cd /d "%~dp0"
start "LeafGuard AI Backend (Port 8000)" cmd /k "run_backend.bat"
timeout /t 3 /nobreak >nul
start "LeafGuard AI Frontend (Port 5173)" cmd /k "run_frontend.bat"
echo.
echo Servers launched in separate windows!
echo Frontend will be accessible at: http://localhost:5173
echo Backend API Docs will be at:    http://localhost:8000/docs
echo.
