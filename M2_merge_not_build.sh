echo "------------------------"
echo "| M2: MERGE not build      |"
echo "------------------------"

cd ../temp_git

echo "STATE: merge develop build folder to master"
commitId=$(git rev-parse develop)
git checkout master

# If there are other changes only merge the build folder else do a full merge
diffAll=$(git diff master..$commitId ./)
diffBuild=$(git diff master..$commitId ./build)
if [ "$diffBuild" != "" ] && [ "$diffAll" != "$diffBuild" ]; then
    echo "STATE: Not build only merge"
    # git checkout develop build/
    git commit -m "Merge build folder from commit '$commitId'"
else
    echo "STATE: Full merge"
    git merge $commitId --no-edit -m "Merge all not build '$commitId'"
fi
