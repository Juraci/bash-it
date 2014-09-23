#!/bin/bash
dir=${0%/*}
source $dir/logger.sh

# Description: logs the message in the log file and returns 0
# parameters: $@ whatever is passed to be logged
success() { logger.log_it "$@"; return 0; }

# Description: logs the message in the log file and returns 1
# parameters: $@ whatever is passed to be logged
failure() { logger.log_it "$@"; return 1; }

# Description: verifies if the command passed as argument exists in 0
# parameters: $@ shell commands to be called
assertions.verify_command() {
  eval "$@"
  if [ $? -eq 0 ]; then
    success "[Command OK] ------: $@"
  else
    failure "[Command FAIL] ----: $@"
  fi
}

# Description: verifies if the directory exists
# parameters: $1 directory path to be verified
assertions.directory_exists?() {
  if [ -d $1 ]; then
    success "[OK] Directory $1 exists"
  else
    failure "[FAIL] Directory $1 doesn't exist"
  fi
}

# Description: verifies if the file exists
# parameters: $1 file path to be verified
assertions.file_exists?() {
  if [ -f $1 ]; then
    success "[OK] File $1 exists"
  else
    failure "[FAIL] File $1 doesn't exist"
  fi
}
