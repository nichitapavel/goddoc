# Defined in - @ line 1
# File test-net-lab-pavel.txt holds a list of hosts (devices) to wich copy your files.
# For more info check http://manpages.ubuntu.com/manpages/focal/man1/parallel-scp.1.html
function pscp --wraps=parallel-scp --description 'alias pscp=parallel-scp -o stdout -e stderr -h ~/work/pssh/test-net-lab-pavel.txt'
  parallel-scp -o stdout -e stderr -h ~/work/pssh/test-net-lab-pavel.txt $argv;
end

