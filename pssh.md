Parallel ssh or scp
===================
Run same commands or transfer same files to multiple remote devices with one command.
For an example of host file look at pssh-hosts.

Install:
========
- ubuntu 20.04: `sudo apt install pssh`

Commands:
=========
- Run command `lsb_release -a` with a maximum of 2 concurrent conections on hosts specified in _pssh-hosts_ and save output to folder _pssh_:  
  `parallel-ssh -p 2 -h pssh-hosts -o ./pssh -e ./pssh "lsb_release -a"`
- Run and show in console the output of command (don't save to files):  
  `parallel-ssh -i "lsb_release -a"`
- Copy _blender-2.91.2-linux64.tar.xz_ on hosts specified in _pssh-hosts_ in _/tmp/_ folder:  
  `parallel-scp -h pssh-hosts blender-2.91.2-linux64.tar.xz /tmp/`

REFERENCES:  
[1] - https://linux.die.net/man/1/pssh  
[2] - https://www.golinuxcloud.com/pssh-commands-parallel-ssh-linux-examples/
