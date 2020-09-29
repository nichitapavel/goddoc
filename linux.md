Linux configuration stuff
=========================

### Swap
Remove the **Swap**:
- Turn off swap:
  ```bash
  sudo swapoff <swap path>
  ```
  For __<swap path>__  use <tab> to autocomplete or check below
- If swap is a file, remove it:
  ```bash
  sudo rm /swap.img
  ```
- Remove the swap line declared in /etc/fstab
- Other usefull commands:
  - ```swaplabel```: display/change swab labels
  - ```swapon```: turn on/display swap details
  - ```cat /proc/swaps```: display swaps in use
  - ```sudo parted -l```: manage unassigned disk space (in case swap was a partition)


### Environment variables [1]
In a shell, a shell variable is NOT an environment variable until is exported.
There are `system-wide` variables, for every user in the system and all other stuff that a system has,
and the `session-wide` variables, for a particular user [3].

- **/etc/environment**: system-wide environment variables, consists of assignment expressions (one per line and is not a script).
- **/etc/profile.d/\***: system-wide environment variables, available to all sessions and all users on bash and desktop sessions. THE RECOMMENDED WAY for the system.
- **~/.pam_environment**: session-wide environment variables, specifically meant for setting a user's environment, works like **/etc/environment** (supposedly every shell can use it, but not fish).
- **~/.profile**: session-wide environment variables, the recommended way for user environment variables. The BAD: it doesn't work with all shells (fish speciffically, maybe others too).

##### DON'T USE
- **/etc/profile**: is not recommended to edit this file, better use **/etc/profile.d/<something>.sh**.
- **/etc/default/locale**: locale system-wide, there is no reason to edit this file.
- **/etc/bash.bashrc**, **~/.bashrc**, **~/.bash_profile**, and **~/.bash_login**: works for `bash`, but ONLY `bash`.


### Understandig shells [2]

Important: you can have multiple "forms" of a shell, (non) login, (non) interactive, graphicall, etc.

Default "forms" of shell:
- ssh: interactive and login shell.
- terminal emulator: non-login interactive shell.
- gui: depends on environment and the system, graphical shell.
- script: non login and non interactive.

Depending on what "form" of shell, the configurations files may differ.

Shell "forms":
- login: when the shell starts by authenticating or identifying the user.
Reads configuration files in this order: /etc/profile, ~/.bash_profile, ~/.bash_login and ~/.profile and stops (valid for bash).
- non login: when a user starts a new session from an authenticated session, no authentication is requiered.
Reads configuration files in this order: /etc/bashrc, ~/.bashrc (valid for bash).
- interactive: when a shell session is coupled to a terminal.
- non interactive: when a shell session is NOT coupled to a terminal.


### Ubuntu 20.04 server suspending [4]
Appeareantly someone has decided that default behaviour of server version is to go to sleep every 30 minutes more or less.
To disable it do:

- Create a directory named `sleep.conf.d` in `/usr/lib/systemd/`
- Copy file `sleep.conf` from `config` directory to `/usr/lib/systemd/sleep.conf.d/`


REFERENCES:
[1] - https://help.ubuntu.com/community/EnvironmentVariables#Persistent_environment_variables
[2] - https://net2.com/what-is-the-difference-between-non-login-and-login-non-interactive-and-interactive-shell-sessions-in-linux-ubuntu-debian/
[3] - https://superuser.com/questions/555081/ubuntu-environment-setting-for-gui-session-or-making-the-same-with-terminal
[4] - http://manpages.ubuntu.com/manpages/focal/man5/systemd-sleep.conf.5.html
