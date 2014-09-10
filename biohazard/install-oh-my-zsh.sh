#!/bin/bash
dir=${0%/*}
source $dir/assertions.sh

assertions.verify_command wget --no-check-certificate http://install.ohmyz.sh -O - | sh
