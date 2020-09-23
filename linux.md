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


### Environment variables
In a shell, a shell variable is NOT an environment variable until is exported.

- **/etc/environment**: system-wide environment variables, consists of assignment expressions (one per line and is not a script).
- **/etc/profile.d/\***: system-wide environment variables, available to all sessions and all users on bash and desktop sessions. THE RECOMMENDED WAY for the system.
- **~/.pam_environment**: specifically meant for setting a user's environment, works like **/etc/environment** (supposedly every shell can use it, but not fish).
- **~/.profile**: environment variables for user, the recommended way for user environment variables. The BAD: it doesn't work with all shells (fish speciffically, maybe others too).

##### DON'T USE
- **/etc/profile**: is not recommended to edit this file, better use **/etc/profile.d/<something>.sh**.
- **/etc/default/locale**: locale system-wide, there is no reason to edit this file.
- **/etc/bash.bashrc**, **~/.bashrc**, **~/.bash_profile**, and **~/.bash_login**: works for `bash`, but ONLY `bash`.