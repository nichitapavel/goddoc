Sources for ubuntu 20.04
========================

- Each `.list` file has a few lines with instructions
- Most of the times you want to copy `.list` files to `/etc/apt/sources.list.d/.` directory
- Extension-less files are `.pin` files, copy them to `/etc/apt/preferences.d/.` directory
- Files with extensions `key`, `gpg`, `asc` and `pub` are keys, add them to your keychains (see `man apt-key`)
- Key files _(if not found here)_ are in `ubuntu18.04` directory
