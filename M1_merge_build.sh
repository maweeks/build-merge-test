echo "------------------------"
echo "| M1: MERGE build      |"
echo "------------------------"

cd ../temp_git

echo "STATE: merge develop build folder to master"
commitId=$(git rev-parse develop)
commitIdMaster=$(git rev-parse master)
git checkout master

# If there are other changes only merge the build folder else do a full merge
diffAll=$(git diff master..$commitId ./)
diffBuild=$(git diff master..$commitId ./build)
if [ "$diffBuild" = "$diffAll" ] && [ "$commitId" != "$commitIdMaster" ]; then
    echo "STATE: Full merge"
    output=$(git merge $commitId --no-edit -m "Merge all build '$commitId'" | grep "Merge made")
    if [[ $output != "" ]]; then
        echo "buildALL" >> ../actual
    fi
elif [ "$diffBuild" != "" ] &&  [ "$diffAll" != "$diffBuild" ]; then
    echo "STATE: Build only merge"
    git checkout "$commitId" ./build/
    git commit -m "Merge build folder from commit '$commitId'"
    echo "buildDIR" >> ../actual
fi
