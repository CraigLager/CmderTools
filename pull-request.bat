@echo off

REM usage: pull-request [username] [repo]

set USER=%1
set REPO=%2

REM get the git branch into a variable by writing output to a temp file then reading it into a variable
git rev-parse --abbrev-ref HEAD > pr-temp.pr
set /p VAR= <pr-temp.pr
del /f pr-temp.pr

REM remove any #'s from the git branch
set VAR=%VAR:#=%

REM open the pull request in a brower, appending %23 to the branch name, which is a url encoded #
explorer "https://github.com/%USER%/%REPO%/compare/%%23%VAR%?expand=1"
