echo "------------------------"
echo "| 1: Setup git repo    |"
echo "------------------------"
cd ..
mkdir temp_git
cd temp_git
mkdir build
mkdir code
touch build/build-job
touch code/repo-code.rb
ls */
git init
git add .
git commit -m "Initial commit."
git checkout -b develop
