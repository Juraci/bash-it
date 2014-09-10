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
  if [ $? -eq 0 ] ; then
    success "[Command OK] ------: $@"
  else
    failure "[Command FAIL] ----: $@"
  fi
}
