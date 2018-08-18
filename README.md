# Build merge test

Some test scripts to merge a specific folder between git branches.

## Scripts

### 0_reset.sh

Deletes all content created locally from the other scripts.

### 1_setup_git_repo.sh

Creates a git repo and initial commit and branches in an adjacent folder.

### 2_commit_to_build.sh

Adds a file to the build folder on the develop branch.

### 3_commit_to_code.sh

Adds a file to the code folder on the develop branch.

### 4_commit_to_both.sh

Adds a file to both the build and code folders on the develop branch.

### M1_merge_build.sh

Merges the build folder from the develop branch to the master branch.

### M2_merge_all.sh

Merges the whole develop branch to the master branch.

### Q_branch_diff.sh

Show differences between develop and master branch.

## Running order

Run `0_reset.sh` followed by `1_setup_git_repo.sh` to set up the prerequisites for the project.

Run `2_commit_to_build.sh`, `3_commit_to_code.sh` or  `4_commit_to_both.sh`, or any combination of them together.

Run either `M1_merge_build.sh` or `M2_merge_all.sh` to merge some / all of the develop branch to master.

Run `Q_branch_diff.sh` to show the difference between the develop and master branches.

Run `0_reset.sh` again if you want to wipe the test directory.

## Example run

```bash
sh 0_reset.sh;
sh 1_setup_git_repo.sh; sleep 1;
sh 2_commit_to_build.sh; sleep 1;
sh M1_merge_build.sh; sleep 1; sh M2_merge_all.sh; sleep 1;
sh 3_commit_to_code.sh; sleep 1;
sh M1_merge_build.sh; sleep 1; sh M2_merge_all.sh; sleep 1;
sh 4_commit_to_both.sh; sleep 1;
sh M1_merge_build.sh; sleep 1; sh M2_merge_all.sh; sleep 1;
sh 2_commit_to_build.sh; sleep 1;
sh M1_merge_build.sh; sleep 1; sh M2_merge_all.sh; sleep 1;
sh 3_commit_to_code.sh; sleep 1;
sh M1_merge_build.sh; sleep 1; sh M2_merge_all.sh; sleep 1;
sh 4_commit_to_both.sh; sleep 1;
sh M1_merge_build.sh; sleep 1; sh M2_merge_all.sh; sleep 1;
sh Q_branch_diff.sh;
```

The M1 merge after script 2 runs shows that it will do a standard full merge if there are only build changes to be merged, reducing commits in the commit log.

The M1 merge after script 3 runs shows that it will not create a merge commit if there are no changes in the build folder.

The M1 merge after script 4 shows that only the build changes get merged.

The M2 merge after script 4 shows that the full merge will complete a full merge if a build merge has already been done.
