# xfce display manager - LightDM
# command sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings -y
# command sudo systemctl enable lightdm.service --force

# gnome display manager - GDM
# command sudo pacman -S manjaro-settings-manager -y
# command sudo systemctl enable gdm.service --force
# command systemctl is-active gdm.service

function testargc
  set -l lcount (count $argc)
  printf "(count argc) = %s" $lcount
  printf "argc = %s" $argc
  printf "argv = %s" $argv
  set -e lcount
end

function set_help
  function lpc -a color txt
    set_color normal
    set_color "$color"
    printf "%s" $txt
    set_color normal
  end

  function lpo -a short long
    set_color normal
    set_color brblue
    printf "%s" "$short"
    set_color brwhite
    printf " or "
    set_color brblue
    printf "%s" "$long "
    set_color normal
  end

  lpc "yellow" "Scope Options"
  printf "\n"
  lpo "-a" "--append"
  lpc "brwhite" " causes the values to be appended to the current set of values for the variable."
  printf "\n"
  lpo "-p" "--prepend"
  lpc "brwhite" " causes the values to be prepended to the current set of values for the variable."
  printf "\n"
  lpo "-l" "--local"
  lpc "brwhite" " forces the specified shell variable to be given a scope that is local to the current block, even if a variable with the given name exists and is non-local."
  printf "\n"
  lpo "-g" "--global"
  lpc "brwhite" " causes the specified shell variable to be given a global scope. Non-global variables disappear when the block they belong to ends."
  printf "\n"
  lpo "-U" "--universal"
  lpc "brwhite" " causes the specified shell variable to be given a universal scope. If this option is supplied, the variable will be shared between all current user's fish instances on the current computer, and will be preserved across restarts of the shell."
  printf "\n"
  lpo "-x" "--export"
  lpc "brwhite" " causes the specified shell variable to be exported to child processes (making it an \" environmental variable\")"
  printf "\n"
  lpo "-u" "--unexport"
  lpc "brwhite" " causes the specified shell variable to NOT be exported to child processes."
  printf "\n"
  lpc "brblue" "--path"
  lpc "brwhite" " causes the specified variable to be treated as a path variable, meaning it will automatically be split on colons, and joined using colons when quoted (echo \""
  lpc "brwhite" '$PATH'
  lpc "brwhite" "\") or exported."
  printf "\n"
  lpc "brblue" "--unpath"
  lpc "brwhite" " does the opposite as "
  lpc "brblue" "--path"
  lpc "brwhite" "."
  printf "\n"
  lpc "yellow" "Other Options"
  printf "\n"
  lpo "-e" "--erase"
  lpc "brwhite" " causes the specified shell variable to be erased."
  printf "\n"
  lpo "-q" "--query"
  lpc "brwhite" " test if the specified variable name(s) are defined. Does not output anything, but the builtins exit status is the number of variables specified that were not defined."
  printf "\n"
  lpo "-n" "--names"
  lpc "brwhite" " List only the names of all defined variables, not their value. The names are guaranteed to be sorted."
  printf "\n"
  lpo "-s" "--show"
  lpc "brwhite" " Shows information about the given variables. If no variable names are given then all variables are shown in sorted order. No other flags can be used with this option. The information shown includes whether or not it is set in each of the local, global, and universal scopes."
  printf "\n"
  lpo "-L" "--long"
  lpc "brwhite" " do not abbreviate long values when printing set variables."
  printf "\n"
end

function test_help
  function lprintopt -a letter input ifstr
    set_color normal
    set_color green
    printf "%s" "-$letter "
    set_color yellow -d
    printf "%s" "$input "
    set_color normal
    set_color brwhite
    printf "%s" "RetTrue if "
    set_color green
    printf "%s" $ifstr
    set_color brwhite
    printf "%s.\n"
    set_color normal
  end

  function lprintopt2 -a symbol input ifstr
    set_color normal
    set_color yellow -d
    set -l lione (printf "%s%s" "$input" "1")
    set -l litwo (printf "%s%s" "$input" "2")
    printf "%s" "$lione "
    set_color normal
    set_color green
    printf "%s" "$symbol"
    set_color yellow -d
    printf "%s" " $litwo "
    set_color normal
    set_color brwhite
    printf "%s" "RetTrue if "
    set_color green
    printf "%s" $ifstr
    set_color brwhite
    printf "%s.\n"
    set_color normal
  end
  
  function lfilehdr
    set -l ldiv "=============="
    set_color normal
    set_color cyan -d
    printf "%s\n" "$ldiv"
    set_color normal
    set_color cyan
    printf "%s\n" "= File Tests ="
    set_color normal
    set_color cyan -d
    printf "%s\n" "$ldiv"
    set -e ldiv
  end

  function lstrhdr
    set -l ldiv "====================="
    set_color normal
    set_color cyan -d
    printf "%s\n" "$ldiv"
    set_color normal
    set_color cyan
    printf "%s\n" "= Text String Tests ="
    set_color normal
    set_color cyan -d
    printf "%s\n" "$ldiv"
    set -e ldiv
  end

  function lnumhdr
    set -l ldiv "================"
    set_color normal
    set_color cyan -d
    printf "%s\n" "$ldiv"
    set_color normal
    set_color cyan
    printf "%s\n" "= Number Tests ="
    set_color normal
    set_color cyan -d
    printf "%s\n" "$ldiv"
    set -e ldiv
  end

  function lcombohdr
    set -l ldiv "==============="
    set_color normal
    set_color cyan -d
    printf "%s\n" "$ldiv"
    set_color normal
    set_color cyan
    printf "%s\n" "= Combination ="
    set_color normal
    set_color cyan -d
    printf "%s\n" "$ldiv"
    set -e ldiv
  end
  lprinthdr
  lprintopt "b" "File" "block device"
  lprintopt "c" "File" "character device"
  lprintopt "d" "File" "directory"
  lprintopt "e" "File" "exists"
  lprintopt "f" "File" "regular file"
  lprintopt "g" "File" "set-group-ID bit is set"
  lprintopt "k" "File" "sticky bit is supported by OS and set"
  lprintopt "L" "File" "symbolic link"
  lprintopt "O" "File" "exists and belongs to current user"
  lprintopt "p" "File" "named pipe"
  lprintopt "r" "File" "marked readable"
  lprintopt "s" "File" "file size is greater than zero"
  lprintopt "S" "File" "is a socket"
  lprintopt "t" "FileDescriptor" "FD refers to a terminal (TTY)"
  lprintopt "u" "File" "set-user-ID bit is set"
  lprintopt "w" "File" "marked writable (FileSys might still be read-only)"
  lprintopt "x" "File" "marked executable"
  lstrhdr
  lprintopt2 '=' 'STRING' 'the two strings are identical'
  lprintopt2 '!=' 'STRING' 'the two strings are not identical'
  lprintopt "n" 'STRING' 'the length is non-zero'
  lprintopt "z" 'STRING' 'the length is zero'
  lnumhdr
  lprintopt2 '-eq' 'NUM' 'the two numbers are numerically equal'
  lprintopt2 '-ne' 'NUM' 'the two numbers are not numerically equal'
  lprintopt2 '-gt' 'NUM' 'N1 is greater than N2'
  lprintopt2 '-ge' 'NUM' 'N1 is greater than or equal to N2'
  lprintopt2 '-lt' 'NUM' 'N1 is less than N2'
  lprintopt2 '-le' 'NUM' 'N1 is less than or equal to N2'
  lcombohdr
  lprintopt2 '-a' 'COND' 'both C1 and C2 are true'
  lprintopt2 '-o' 'COND' 'either C1 or C2 are true'
end


function _unset -a Var DryRun
  set_color normal
  if set -q "$Var"
    set_color red
    printf "Variable %s is not currently set." $Var
    set_color normal
    exit 0
  end

  if test -z $Var
    set_color red
    printf "Variable %s is already empty." $Var
    exit 0
  end

  set -l lisdryrun (test -z $DryRun)
  printf "lisdryrun = %s" $lisdryrun
  printf "Unsetting Variable %s" $Var
  # command set -e $Var
end

function set_service_running -a svc var varargs DryRun
  if test -z $DryRun
    set -l $DryRun 0
  else
    set -l $DryRun 1
  end
  set_color normal
  if test -z $var
    set_color red; printf "%s\n" "A variable name needs to be provided."
    set_color normal
    exit 0
  end

  if test -z $svc
    set_color red; printf "%s\n" "A service name needs to be provided."
    set_color normal
    exit 0
  end

  if [ (systemctl is-active $svc) = "active" ]
    printf "Setting \'%s\' to True (1) using args \'%s\'.\n" "$var" "$varargs"
    set "$varargs" "$var" 1
  else
    set "$varargs" "$var" 0
    printf "Setting \'%s\' to False (0) using args \'%s\'.\n" "$var" "$varargs"
  end
end

function is_xfce
  if [ (systemctl is-active gdm.service) = "active" ]
    set -l lgdmOn "is"
  else
    set -l lgdmOn "is not"
  end
  if [ (systemctl is-active lightdm.service) = "active" ]
    set -l lldmOn "is"
  else
    set -l lldmOn "is not"
  end

  printf "The XFCE Manager (lightdm) %s running." $lldmOn
  printf "The Gnome Manager (gdm) %s running." $lgdmOn
end

function is_gnome
  is_xfce
end

function fish_config_txt -d "Opens the fish config file with nano(c)"
 	nano ~/.config/fish/config.fish
end

function treejs -d "Runs the \'tree\' command but excludes \'node_modules\'."
	command tree -I "node_modules"
end

function nano -d "Opens the nano editor with a few added flags" -w "/usr/bin/nano"
	command /usr/bin/nano --boldtext --mouse --indicator --tabsize=2 --tabstospace --autoindent --historylog $argv
end

function nano_stock -d "Opens the stock (/usr/bin/nano) version of nano."
  command /usr/bin/nano $argv
end

function lspac -d "Lists all installed packages sorted by install size."
	command pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h
end 

function lspact -d "Lists the last 20 packages that were installed."
	command expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -n 20
end

function rmrf
  command rm -rf $argv
end

function weather -d "Curls wttr.in for the current weather forecast."
	command curl wttr.in
end

function fndesc -a fnName -d "Outputs the description of a given function."
  set lines (functions --details --verbose $fnName)
  echo $lines[5]
end

function mkb
  rmrf build
  mkdir build
  cd build
end

function custom_commands -d "Shows the list of functions that I have created."
  function make_div
    set_color normal
    set_color cdcdcd
    string repeat -n 25 '-'
    set_color normal
  end

  function make_bigdiv
    set_color normal
    set_color cdcdcd
    string repeat -n 25 '='
    set_color normal
  end

  function print_command -a Com Desc
    set_color normal
    make_bigdiv
    set_color -o -i -u brwhite
    echo "$Com" | fmt -w 25 -
    make_div
    set_color -i 0FF
    echo "$Desc" | fmt -w 25 -
    set_color normal
    make_bigdiv
    echo ""
  end

  function print_header
    set_color normal
    set_color green 
    echo -e "===================="
    echo -e "=  Custom Commands ="
    echo -e "===================="
    set_color normal
    echo ""
  end

  print_header
  print_command "fish_config" "Opens the fish config file with my customized nano."
  print_command "treejs" "Calls tree with '-I \"node_modules\"' to ignore node_modules. Forwards any args provided."
  print_command "nano" "Calls nano with additional options already provided."
  print_command "nano_stock" "Calls the stock version of nano."
  print_command "lspac" "Show all installed packages sorted by install size."
  print_command "lspact" "Show the 20 most recent packages installed."
  print_command "rmrf" "command rm -rf $argv"
  print_command "weather" "Curls for the current weather forecast from wttr.in"
  print_command "fndesc" "Prints information for a given function."
  set_color normal
end

starship init fish | source
