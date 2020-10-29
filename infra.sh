#!/usr/bin/env bash
set -euo pipefail

# Colors
_red="\e[31m"
_magenta="\e[95m"
_green="\e[32m"
_cyan="\e[36m"
_yellow="\e[33m"
_end="\e[0m"

_bg_gray="\e[100m"
_bg_magenta="\e[45m"
_bg_blue="\e[44m"

_underline_begin="\e[4m"
_underline_end="\e[24m"
_bold_begin="\e[1m"
_bold_end="\e[21m"

clear
cat dox.txt
echo -e "*** ${_bg_gray}${_underline_begin}Infra is looking for you!${_underline_end}${_end} ***"

echo -e "
infra@amdocs:~/ $ ./secomp.sh
infra@amdocs:~/ $ cd secomp/
infra@amdocs:~/secomp $ ./run.sh
[${_cyan}INFO${_end}] Loading details    ... ${_green}OK${_end}
[${_cyan}INFO${_end}] Checking Web page  ... ${_green}OK${_end}
[${_cyan}INFO${_end}] Ready to use!      ... ${_green}OK${_end}
[${_yellow}DEBUG${_end}] Port is listening ... ${_green}OK${_end}
[${_cyan}INFO${_end}] Congratulations =) ... ${_green}OK${_end}
"

echo -e "\n${_bg_blue}${_bold_begin}IF YOU SEE THIS PAGE YOU PROBABLY COMPLETED THE CHALLENGE.${_bold_end}${_end}\n\n"