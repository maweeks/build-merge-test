echo "------------------------"
echo "| 3: Commit to code    |"
echo "------------------------"

cd ../temp_git

echo "STATE: make content"
git checkout develop
echo "Commit to code" > code/code.txt
echo "Commit to code" > file.txt
ls */

echo "STATE: commit to git"
git add .
git commit -m "Commit to code."
