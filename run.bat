@echo off
call flutter analyze
if errorlevel 1 (
    echo Analysis failed: fix the issues before running the app
) else (
    call flutter run
)