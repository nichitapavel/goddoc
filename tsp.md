tsp - Task Spooler
A queue of jobs to be executed locally in your machine.

Instructions for Ubuntu  18.04

Install:
sudo apt install task-spooler -y


Create multiple queues (directories must be previously created):
 TS_SOCKET=/tmp/tsp/rock960 tsp
 TS_SOCKET=/tmp/tsp/odroidxu4_a tsp
Create multiple queues each with own directory (directories must be previously created):
 TMPDIR=/tmp/tsp/rock960d TS_SOCKET=/tmp/tsp/rock960 tsp
 TMPDIR=/tmp/tsp/odroidxu4_ad TS_SOCKET=/tmp/tsp/odroidxu4_a tsp
Create alias for multiple queues (in .bashrc):
  alias tsprock960='TMPDIR=/tmp/tsp/rock960d TS_SOCKET=/tmp/tsp/rock960 tsp'
  alias tspodroidxu4_a='TMPDIR=/tmp/tsp/odroidxu4_ad TS_SOCKET=/tmp/tsp/odroidxu4_a tsp'
  alias tspodroidxu4_b='TMPDIR=/tmp/tsp/odroidxu4_bd TS_SOCKET=/tmp/tsp/odroidxu4_b tsp'
  alias tsphikey970='TMPDIR=/tmp/tsp/hikey970d TS_SOCKET=/tmp/tsp/hikey970 tsp'
  alias tspx20='TMPDIR=/tmp/tsp/x20d TS_SOCKET=/tmp/tsp/x20 tsp'

***Note:
  To have the different queues still available after a reboot, is better to create the directories/sockets in
  a permanent location, I recommend **/var/log**, it will be something like this:
    TMPDIR=/var/log/tsp/rock960d TS_SOCKET=/var/log/tsp/rock960 tsp

Usage:
Add a job to queue:
  tsp echo "Viva la vida"
Show the list of jobs:
  tsp -l
  tsp
Clean the queue of finished jobs:
  tsp -C
Show a job output:
  tsp -c <id>
Show a job execution information:
  tsp -i <id>
Remove a job from the queue:
  tsp -r <id>
