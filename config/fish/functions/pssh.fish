# Defined in - @ line 1
# To specify a list of hosts where to run your commands do:
#   pssh -h <hosts.txt> "<some command>"
# For more info check http://manpages.ubuntu.com/manpages/focal/man1/parallel-ssh.1.html
function pssh --wraps=parallel-ssh --description 'alias pssh=parallel-ssh -o stdout -e stderr '
  parallel-ssh -o stdout -e stderr $argv;
end

