echo "------------------------"
echo "| 4: Commit to both    |"
echo "------------------------"

cd ../temp_git

echo "STATE: make content"
git checkout develop
echo "Commit to both" >> build/commitToBoth.txt
date +%Y-%m-%d.%H:%M:%S >> build/commitToBoth.txt
echo "Commit to both" >> code/commitToBoth.txt
date +%Y-%m-%d.%H:%M:%S >> code/commitToBoth.txt
echo "Commit to both" >> commitToBoth.txt
date +%Y-%m-%d.%H:%M:%S >> commitToBoth.txt
ls */

echo "STATE: commit to git"
git add .
git commit -m "Commit to both."
