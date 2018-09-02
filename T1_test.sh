echo "" > ../expected
echo "" > ../actual

echo "Initial setup." | tee ../expected ../actual
echo "buildDIR" >> ../expected
echo "FULL" >> ../expected

sh 0_reset.sh;
sh 1_setup_git_repo.sh; sleep 1;
sh 4_commit_to_both.sh; sleep 1;
sh M1_merge_build.sh; sleep 1;
sh M3_merge_all.sh; sleep 1;

echo "\nM1, M2:" | tee -a ../expected ../actual
echo "\nTest: file change in build" | tee -a ../expected ../actual
echo "buildALL" >> ../expected
sh 2_commit_to_build_time.sh; sleep 1;
sh M1_merge_build.sh; sleep 1; sh M2_merge_not_build.sh; sleep 1;

echo "\nTest: file change in code" | tee -a ../expected ../actual
echo "otherALL" >> ../expected
sh 3_commit_to_code_time.sh; sleep 1;
sh M1_merge_build.sh; sleep 1; sh M2_merge_not_build.sh; sleep 1;

echo "\nTest: file change in both" | tee -a ../expected ../actual
echo "buildDIR" >> ../expected
echo "otherALL" >> ../expected
sh 4_commit_to_both.sh; sleep 1;
sh M1_merge_build.sh; sleep 1; sh M2_merge_not_build.sh; sleep 1;

echo "\nTest: commit revert in build" | tee -a ../expected ../actual
echo "buildALL" >> ../expected
sh 2_commit_to_build_time.sh; sleep 1;
sh 2_commit_to_build.sh; sleep 1;
sh M1_merge_build.sh; sleep 1; sh M2_merge_not_build.sh; sleep 1;

echo "\nTest: commit revert in code" | tee -a ../expected ../actual
echo "buildALL" >> ../expected
sh 3_commit_to_code_time.sh; sleep 1;
sh 3_commit_to_code.sh; sleep 1;
sh M1_merge_build.sh; sleep 1; sh M2_merge_not_build.sh; sleep 1;

echo "\nTest: commit revert in both" | tee -a ../expected ../actual
echo "buildALL" >> ../expected
sh 4_commit_to_both_time.sh; sleep 1;
sh 4_commit_to_both.sh; sleep 1;
sh M1_merge_build.sh; sleep 1; sh M2_merge_not_build.sh; sleep 1;

echo "\nTest: file change in build and commit revert in code" | tee -a ../expected ../actual
echo "buildALL" >> ../expected
sh 4_commit_to_both_time.sh; sleep 1;
sh 3_commit_to_code.sh; sleep 1;
sh M1_merge_build.sh; sleep 1; sh M2_merge_not_build.sh; sleep 1;

echo "\nTest: reset test" | tee -a ../expected ../actual
echo "FULL" >> ../expected
sh 4_commit_to_both.sh; sleep 1;
sh M3_merge_all.sh; sleep 1;

echo "\nTest: file change in code and commit revert in build" | tee -a ../expected ../actual
echo "otherALL" >> ../expected
sh 4_commit_to_both_time.sh; sleep 1;
sh 2_commit_to_build.sh; sleep 1;
sh M1_merge_build.sh; sleep 1; sh M2_merge_not_build.sh; sleep 1;

echo "\nTest: reset test" | tee -a ../expected ../actual
echo "FULL" >> ../expected
sh 4_commit_to_both.sh; sleep 1;
sh M3_merge_all.sh; sleep 1;

echo "\nM2, M1:" | tee -a ../expected ../actual
echo "\nTest: file change in build" | tee -a ../expected ../actual
echo "buildALL" >> ../expected
sh 2_commit_to_build_time.sh; sleep 1;
sh M2_merge_not_build.sh; sleep 1; sh M1_merge_build.sh; sleep 1;

echo "\nTest: file change in code" | tee -a ../expected ../actual
echo "otherALL" >> ../expected
sh 3_commit_to_code_time.sh; sleep 1;
sh M2_merge_not_build.sh; sleep 1; sh M1_merge_build.sh; sleep 1;

echo "\nTest: file change in both" | tee -a ../expected ../actual
echo "otherDIR" >> ../expected
echo "buildALL" >> ../expected
sh 4_commit_to_both.sh; sleep 1;
sh M2_merge_not_build.sh; sleep 1; sh M1_merge_build.sh; sleep 1;

echo "\nTest: commit revert in build" | tee -a ../expected ../actual
echo "otherALL" >> ../expected
sh 2_commit_to_build_time.sh; sleep 1;
sh 2_commit_to_build.sh; sleep 1;
sh M2_merge_not_build.sh; sleep 1; sh M1_merge_build.sh; sleep 1;

echo "\nTest: commit revert in code" | tee -a ../expected ../actual
echo "otherALL" >> ../expected
sh 3_commit_to_code_time.sh; sleep 1;
sh 3_commit_to_code.sh; sleep 1;
sh M2_merge_not_build.sh; sleep 1; sh M1_merge_build.sh; sleep 1;

echo "\nTest: commit revert in both" | tee -a ../expected ../actual
echo "otherALL" >> ../expected
sh 4_commit_to_both_time.sh; sleep 1;
sh 4_commit_to_both.sh; sleep 1;
sh M2_merge_not_build.sh; sleep 1; sh M1_merge_build.sh; sleep 1;

echo "\nTest: file change in build and commit revert in code" | tee -a ../expected ../actual
echo "buildALL" >> ../expected
sh 4_commit_to_both_time.sh; sleep 1;
sh 3_commit_to_code.sh; sleep 1;
sh M2_merge_not_build.sh; sleep 1; sh M1_merge_build.sh; sleep 1;

echo "\nTest: reset test" | tee -a ../expected ../actual
echo "FULL" >> ../expected
sh 4_commit_to_both.sh; sleep 1;
sh M3_merge_all.sh; sleep 1;

echo "\nTest: file change in code and commit revert in build" | tee -a ../expected ../actual
echo "otherALL" >> ../expected
sh 4_commit_to_both_time.sh; sleep 1;
sh 2_commit_to_build.sh; sleep 1;
sh M2_merge_not_build.sh; sleep 1; sh M1_merge_build.sh; sleep 1;

sh T2_test_diff.sh
