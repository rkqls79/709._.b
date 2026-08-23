@echo off
chcp 65001 >nul
title 차곡차곡 (창을 닫으면 종료됩니다)
cd /d "%~dp0"

rem ── 파이썬 찾기 ──────────────────────────────
set PY=
where python >nul 2>nul && set PY=python
if not defined PY where py >nul 2>nul && set PY=py
if not defined PY goto nopython

rem ── 브라우저 열고 서버 시작 ───────────────────
echo.
echo   차곡차곡을 실행합니다.
echo.
echo   주소: http://localhost:8123
echo.
echo   * 이 검은 창은 켜 두세요. 닫으면 앱이 멈춥니다.
echo   * 휴대폰에서 볼 때는 같은 와이파이에서 아래 주소로 접속하세요.
echo.
for /f "tokens=14" %%i in ('ipconfig ^| findstr /c:"IPv4"') do echo     휴대폰용: http://%%i:8123
echo.
echo ------------------------------------------------------------
echo.

start "" "http://localhost:8123/index.html"
%PY% -m http.server 8123
goto end

:nopython
echo.
echo   파이썬을 찾지 못했습니다.
echo   https://www.python.org/downloads/ 에서 설치한 뒤
echo   (설치 화면에서 "Add python.exe to PATH" 를 꼭 체크) 다시 실행해 주세요.
echo.
pause

:end
