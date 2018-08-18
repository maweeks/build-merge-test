echo "------------------------"
echo "| M2: MERGE all        |"
echo "------------------------"

cd ../temp_git

echo "STATE: merge develop to master"
git checkout master
git merge develop
git diff master..develop
