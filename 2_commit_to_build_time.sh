echo "------------------------"
echo "| 2: Commit to build   |"
echo "------------------------"

cd ../temp_git

echo "STATE: make content"
git checkout develop
echo "Commit to build" > build/build.txt
date +%Y-%m-%d.%H:%M:%S >> build/build.txt
ls */

echo "STATE: commit to git"
git add .
git commit -m "Commit to build."
