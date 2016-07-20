echo off

rem Get root directory of the current script
set root_dir=%~dp0

rem Remove the trailing \
set root_dir=%root_dir:~0,-1%

echo "Initalizing the repository..."

echo "Copying commit-msg hook script to git hooks directory"
if not exist %root_dir%\.git\hooks (
	mkdir %root_dir%\.git\hooks
) else (
	if exist %root_dir%\.git\hooks\commit-msg.sample (
		del %root_dir%\.git\hooks\commit-msg.sample
	)
)
copy %root_dir%\GitHooks\commit-msg %root_dir%\.git\hooks
echo "Done"

echo "Repository Initialized!"