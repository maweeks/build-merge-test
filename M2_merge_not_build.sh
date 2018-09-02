echo "------------------------"
echo "| M2: MERGE other      |"
echo "------------------------"

cd ../temp_git

echo "STATE: merge develop other folder to master"
commitId=$(git rev-parse develop)
commitIdMaster=$(git rev-parse master)
git checkout master

# If there are other changes only merge the build folder else do a full merge
diffAll=$(git diff master..$commitId ./)
diffBuild=$(git diff master..$commitId ./build)
if [ "$diffBuild" = "" ] && [ "$commitId" != "$commitIdMaster" ]; then
    echo "STATE: Full merge"
    output=$(git merge $commitId --no-edit -m "Merge all other '$commitId'" | grep "Merge made")
    if [[ $output != "" ]]; then
        echo "otherALL" >> ../actual
    fi
elif [ "$diffBuild" != "" ] && [ "$diffAll" != "$diffBuild" ]; then
    echo "STATE: Other only merge"
    git checkout "$commitId" ./
    git checkout master ./build
    git commit -m "Merge other folder from commit '$commitId'"
    echo "otherDIR" >> ../actual
fi
