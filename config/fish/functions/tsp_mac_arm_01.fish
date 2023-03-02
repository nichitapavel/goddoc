# To autoload this function in all shells is necesary
# to create a file named as the functions
# for more details read this: 
# https://fishshell.com/docs/current/language.html#autoloading-functions


function tsp_mac_arm_01
  set -lx TMPDIR /var/log/tsp/mac_arm_01
  set -lx TS_MAXFINISHED 20
  set -lx TS_SOCKET /var/log/tsp/mac_arm_01.socket
  tsp $argv
end
