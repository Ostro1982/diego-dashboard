@echo off
REM Daily deepDive filler - runs at 23:00 via Windows Task Scheduler
REM Populates 4 empty projects with deep-dive analysis and pushes to GitHub

setlocal
cd /d C:\Users\Ostro\diego-dashboard

set LOGFILE=scripts\fill_deepdive_last_run.log
echo ============================================ > %LOGFILE%
echo Run started: %DATE% %TIME% >> %LOGFILE%
echo ============================================ >> %LOGFILE%

REM Send prompt to Claude Code headless via stdin. -p prints result.
REM --dangerously-skip-permissions allows auto-accept of file edits + git commands
type scripts\fill_deepdive_prompt.md | claude -p --dangerously-skip-permissions >> %LOGFILE% 2>&1

echo. >> %LOGFILE%
echo ============================================ >> %LOGFILE%
echo Run finished: %DATE% %TIME% >> %LOGFILE%

endlocal
