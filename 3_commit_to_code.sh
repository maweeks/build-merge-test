echo "------------------------"
echo "| 3: Commit to code    |"
echo "------------------------"

cd ../temp_git

echo "STATE: make content"
git checkout develop
echo "Commit to code" >> code/commitToCode.txt
date +%Y-%m-%d.%H:%M:%S >> code/commitToCode.txt
echo "Commit to code" >> commitToCode.txt
date +%Y-%m-%d.%H:%M:%S >> commitToCode.txt
ls */

echo "STATE: commit to git"
git add .
git commit -m "Commit to code."
