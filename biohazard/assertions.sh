#!/bin/bash
dir=${0%/*}
source $dir/logger.sh

# Description: logs the success message in the log file
# parameters: $* shell commands to be logged
# returns: 0
success() { logger.log_it "[Command OK] ------: $*"; return 0; }

# Description: logs the failure message in the log file
# parameters: $* shell commands to be logged
# returns 1
failure() { logger.log_it "[Command FAIL] ----: $*"; return 1; }

# Description: verifies if the command passed as argument exists in 0
# parameters: $* shell commands to be called
assertions.verify_command() {
  eval "$@"
  if [ $? -eq 0 ] ; then
    success "$@"
  else
    failure "$@"
  fi
}
