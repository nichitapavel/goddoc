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


##### Possible environment variables default locations
- /etc/environment
- /etc/profile
- /etc/profile.d/*
- /etc/bash.bashrc
- /etc/security/pam_env.conf
- /etc/locale.conf  # packages specific
- ~/.pam_environment
- ~/.bash_profile
- ~/.bashrc
- ~/.bash_login
- ~/.profile
- ~/.xinitrc
- ~/.config/environment.d/*


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

### Find out the type of shell
To find out what type of shell is being used these options are available:
- execute `echo $0`, if result is:
- - _-bash_ is a **login** shell, the _-_ tells us that
- - _bash_ is not a login shell, the missing _-_ (hyphen) tells us that
- execute `echo $-`, if the result contains a _i_ (like _himBHs_ has an _i_) it means that is an **interactive** shell.
To find out what the other characters mean take a look at \[10], search by _"Options"_ (right at the begining) and _"set \[+abefhkmnptuvxBCEHPT]"_ (almost at the end), or at \[11]


### Ubuntu 20.04 server suspending [4]
Appeareantly someone has decided that default behaviour of server version is to go to sleep every 30 minutes more or less.
To disable it do:

- Create a directory named `sleep.conf.d` in `/usr/lib/systemd/`
- Copy file `sleep.conf` from `config` directory to `/usr/lib/systemd/sleep.conf.d/`


### ping: socket: Operation not permitted [5]
Possibly some distro messup, to fix add the sticky bit:
- `sudo chmod u+s /bin/ping`


### avahi mDNS doesn't work [6]
Install the `libnss-mdns` package or equivalent for your distribution
- `sudo apt install libnss-mdns`


### terminal and mouse (usually wheel: scrolling) prints weird characters [7]
Most probably somehow you enabled graphics mode in terminal (some apps support it for mouse),
type in terminal:
- `reset`


### Network doesn't work but device recognized:
For me it happened on Rock960, usb-c ethernet plugged it, recognized but not network, try and do a `sudo dhclient`.  
The referece [8] explains setting up wifi in terminal, but doing this my usb-c ethernet started to work.

### Change hostname
Specially true if you flash a default image to sd card for a SBC.
- Rename host with `hostnamectl` tool:
`sudo hostnamectl set-hostname <name>`
- Add to the line `127.0.0.1   localhost` in **/etc/hosts** your *<name>*, it will be like this:  
`127.0.0.1   localhost <name>`.  
If `127.0....` is not present just add it yourself.

### Disable annoying beep sound in terminal [9]:
Open **/etc/inputrc** and search for `set bell-style none`, either enable it or add it.

### echo magic
Let's say that you have a long string with escaped characters all other the place, like this one:
```
import \"influxdata/influxdb\"\n\noption task = { name: \"cardinality_by_bucket\", every: 1h0m0s }\n\n\n\n\nbuckets()\n\t|> map(fn: (r) => {\n\t\tcardinality = influxdb.cardinality(bucket: r.name, start: -task.every)\n\t\t\t|> findRecord(idx: 0, fn: (key) =>\n\t\t\t\t(true))\n\n\t\treturn {\n\t\t\t_time: now(),\n\t\t\t_measurement: \"buckets\",\n\t\t\tbucket: r.name,\n\t\t\t_field: \"cardinality\",\n\t\t\t_value: cardinality._value,\n\t\t}\n\t})\n\t|> to(bucket: \"cardinality\")
```
and your really want to make it readable. Use `echo -e "<string>"`, like here:
```
echo -e "import \"influxdata/influxdb\"\n\noption task = { name: \"cardinality_by_bucket\", every: 1h0m0s }\n\n\n\n\nbuckets()\n\t|> map(fn: (r) => {\n\t\tcardinality = influxdb.cardinality(bucket: r.name, start: -task.every)\n\t\t\t|> findRecord(idx: 0, fn: (key) =>\n\t\t\t\t(true))\n\n\t\treturn {\n\t\t\t_time: now(),\n\t\t\t_measurement: \"buckets\",\n\t\t\tbucket: r.name,\n\t\t\t_field: \"cardinality\",\n\t\t\t_value: cardinality._value,\n\t\t}\n\t})\n\t|> to(bucket: \"cardinality\")"
```

### Fish debug [12]
To debug fish scripts or configurations like _~/.config/fish/config.fish_ add this `set -l fish_trace on` to the start of the file.

REFERENCES:  
[1] - https://help.ubuntu.com/community/EnvironmentVariables#Persistent_environment_variables  
[2] - https://net2.com/what-is-the-difference-between-non-login-and-login-non-interactive-and-interactive-shell-sessions-in-linux-ubuntu-debian/  
[3] - https://superuser.com/questions/555081/ubuntu-environment-setting-for-gui-session-or-making-the-same-with-terminal  
[4] - http://manpages.ubuntu.com/manpages/focal/man5/systemd-sleep.conf.5.html  
[5] - http://blackhold.nusepas.com/2015/08/06/ping-icmp-open-socket-operation-not-permitted/  
[6] - https://forums.balena.io/t/ping-devices-on-the-local-network-via-hostname/2082  
[7] - https://apple.stackexchange.com/questions/326266/in-terminal-scrolling-prints-weird-characters  
[8] - http://sirlagz.net/2012/08/27/how-to-use-wpa_cli-to-connect-to-a-wireless-network/  
[9] - https://stackoverflow.com/questions/36724209/disable-beep-in-wsl-terminal-on-windows-10  
[10] - https://linux.die.net/man/1/bash  
[11] - https://tldp.org/LDP/abs/html/options.html  
[12] - https://stackoverflow.com/questions/34188411/how-to-debug-fish-script#answer-67686844  
