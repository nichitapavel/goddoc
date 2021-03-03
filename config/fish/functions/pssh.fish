# Defined in - @ line 1
# File test-net-lab-pavel.txt holds a list of hosts (devices) to wich run your commands.
# For more info check http://manpages.ubuntu.com/manpages/focal/man1/parallel-ssh.1.html
function pssh --wraps=parallel-ssh --description 'alias pssh=parallel-ssh -o stdout -e stderr -h ~/work/pssh/test-net-lab-pavel.txt'
  parallel-ssh -o stdout -e stderr -h ~/work/pssh/test-net-lab-pavel.txt $argv;
end

