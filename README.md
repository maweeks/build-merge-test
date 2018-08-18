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

## Running order

Run `0_reset.sh` followed by `1_setup_git_repo.sh` to set up the prerequisites for the project.

Run `2_commit_to_build.sh`, `3_commit_to_code.sh` or  `4_commit_to_both.sh`, or any combination of them together.

Run either `M1_merge_build.sh` or `M2_merge_all.sh` to merge some / all of the develop branch to master.
