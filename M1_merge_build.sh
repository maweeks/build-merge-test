echo "------------------------"
echo "| M1: MERGE build      |"
echo "------------------------"

cd ../temp_git

echo "STATE: merge develop build folder to master"
commitId=$(git rev-parse develop)
git checkout master
git branch
git checkout develop build/
git status
git commit -m "Merge build folder from commit '$commitId'"
