echo "------------------------"
echo "| T2: Branch diff      |"
echo "------------------------"

echo "<-------------------- Start of act -------------------->"
cat ../actual
echo "<--------------------  End of act  -------------------->"
echo "<-------------------- Start of exp -------------------->"
cat ../expected
echo "<--------------------  End of exp  -------------------->"

diff -y ../expected ../actual

diffTest=$(diff ../expected ../actual)

if [ "$diffTest" != "" ]; then
    echo "\nOne or more tests have failed."
else
    echo "\nTests have passed."
fi
