echo "------------------------"
echo "| 2: Commit to build   |"
echo "------------------------"

cd ../temp_git

echo "STATE: make content"
git checkout develop
echo "Commit to build" > build/build.txt

echo "STATE: commit to git"
git add .
git commit -m "Commit to build."
