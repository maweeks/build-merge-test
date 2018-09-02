echo "------------------------"
echo "| 4: Commit to both    |"
echo "------------------------"

cd ../temp_git

echo "STATE: make content"
git checkout develop
echo "Commit to build" > build/build.txt
date +%Y-%m-%d.%H:%M:%S >> build/build.txt
echo "Commit to code" > code/code.txt
date +%Y-%m-%d.%H:%M:%S >> code/code.txt
echo "Commit to code" > file.txt
date +%Y-%m-%d.%H:%M:%S >> file.txt
ls */

echo "STATE: commit to git"
git add .
git commit -m "Commit to both."
