echo "------------------------"
echo "| Q: Branch diff       |"
echo "------------------------"

cd ../temp_git

echo "STATE: show diff between branches"
git diff master..develop
