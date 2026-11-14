@echo off
chcp 65001 >nul
title FlowMusic 导演台 · 社区体验版
cd /d "%~dp0"

netstat -ano | findstr ":3888 " | findstr "LISTENING" >nul
if %errorlevel%==0 (
    start "" "http://127.0.0.1:3888"
    exit /b 0
)

set "NODE_BIN=node"
if exist "%~dp0runtime\node.exe" set "NODE_BIN=%~dp0runtime\node.exe"
if exist "%~dp0node.exe" set "NODE_BIN=%~dp0node.exe"

start "" "http://127.0.0.1:3888"
"%NODE_BIN%" "%~dp0server.js"
pause
