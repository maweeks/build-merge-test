echo "------------------------"
echo "| 1: Setup git repo    |"
echo "------------------------"

echo "STATE: make base folder"
cd ..
mkdir temp_git
cd temp_git

echo "STATE: make content"
mkdir build
mkdir code
touch build/build-job
touch code/repo-code.rb
ls */

echo "STATE: initialise git repo"
git init
git add .
git commit -m "Initial commit."
git checkout -b develop
