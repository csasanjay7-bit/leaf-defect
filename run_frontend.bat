@echo off
echo ===================================================
echo   LeafGuard AI - Starting Frontend Server
echo ===================================================
cd /d "%~dp0\frontend"
call npm run dev
pause
