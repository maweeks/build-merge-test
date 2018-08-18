echo "------------------------"
echo "| M2: MERGE all        |"
echo "------------------------"

cd ../temp_git

echo "STATE: merge develop to master"
commitId=$(git rev-parse develop)
git checkout master
git merge $commitId --no-edit -m "Merge commit '$commitId'"
