echo "------------------------"
echo "| M3: MERGE all        |"
echo "------------------------"

cd ../temp_git

echo "STATE: merge develop to master"
commitId=$(git rev-parse develop)
git checkout master
git merge $commitId --no-edit -m "Merge all '$commitId'"
echo "FULL" >> ../actual
