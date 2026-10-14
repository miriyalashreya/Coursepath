@echo off
title CoursePath - Full Stack Launcher
color 0b
echo ====================================================================
echo        CoursePath: Academic Prerequisite & Course Planning System   
echo ====================================================================
echo.

set ROOT_DIR=%~dp0

echo [1/3] Checking prerequisites...
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Java is not detected in your PATH. Please install Java 17 or higher.
    pause
    exit /b 1
)

where npm >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Node.js / npm is not detected in your PATH. Please install Node.js.
    pause
    exit /b 1
)
echo  - Java and Node.js detected successfully!
echo.

echo [2/3] Starting Spring Boot Backend (Port 8080)...
start "CoursePath Backend (Spring Boot)" cmd /k "cd /d "%ROOT_DIR%backend" && mvnw.cmd spring-boot:run"

echo [3/3] Starting React Frontend (Port 5173)...
start "CoursePath Frontend (React Vite)" cmd /k "cd /d "%ROOT_DIR%frontend" && npm.cmd run dev"

echo.
echo ====================================================================
echo  CoursePath is starting up!
echo   - Backend API:       http://localhost:8080
echo   - H2 Console:        http://localhost:8080/h2-console
echo   - Frontend Portal:   http://localhost:5173
echo.
echo  Demo Credentials:
echo   - Student: username: student  ^| password: student123
echo   - Admin:   username: admin    ^| password: admin123
echo ====================================================================
echo.
echo Opening browser in 6 seconds...
timeout /t 6 >nul
start http://localhost:5173
echo Application launched! You can leave these terminal windows open.
pause
