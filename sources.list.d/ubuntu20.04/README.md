Sources for ubuntu 20.04
========================

## General:

- **Don't expect consistency, I'm not a consistent person (sorry future me)**
- There is an instruction for each source (manual, auto or semi-auto)
- Vendor instruction (click on link) may be different, but similar to what is here
- Each `.list` file is mostly what you get with **auto** instructions
- Most of the times you want to copy `.list` files to `/etc/apt/sources.list.d/.` directory
- Extension-less files are `.pin` files
- `*.pin` are... pin files (there may be duplicates)
- copy `.pin` files to `/etc/apt/preferences.d/.` directory
- Files with extensions `key`, `gpg`, `asc` and `pub` are keys
- If Key files are not here, they are in `ubuntu18.04` directory
- `.pgp` files are exported keys from my keychain
- Add keys to the keychain (see `man apt-key`), either `.pgp` or the rest
- Most probably there will repeated keys, that's because same packages install their's source file when installing a package


## Simple instalation:

- Copy all `*.list` files to `/etc/apt/sources.list.d`
- Copy all `pin` files to `/etc/apt/preferences.d`
- Add `pgp` keys to a keychain (custom or default)
- Update sources

#### Step by step instructions (custom keychain):
```bash
sudo cp *.list /etc/apt/sources.list.d/.
sudo cp pin/* etc/apt/preferences.d/.
for pgp in /pgp/*.pgp; do sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg add "$pgp"; done
sudo apt update
```
**NOTE:** when installing packages, some of them, can ask which _source list_ to keep, you can
safely keep currently-installed version, but check the differences and decide.


## One by one

### [Docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
**Manual:**
- `sudo vim docker.list` -> add repositories location, save and quit.
- `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg add -`  
or `sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg add docker.gpg`

### [GitHub CLI](https://github.com/cli/cli/blob/trunk/docs/install_linux.md)
**Semi-Auto:**
- `sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg adv --keyserver keyserver.ubuntu.com --receive-keys C99B11DEB97541F0`
- `sudo sudo apt-add-repository https://cli.github.com/packages`

Why "Semi-Auto" ? It adds the repositories to `/etc/apt/sources.list` and
is better to have it in `/etc/apt/sources.list.d/github_cli.list`.
Just do the manual steps.

**Manual:**
- `sudo vim github_cli.list` -> add repositories location, save and quit.
- `sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg adv --keyserver keyserver.ubuntu.com --receive-keys C99B11DEB97541F0`

### [GitHub git-LFS](https://packagecloud.io/github/git-lfs/install#manual-deb)
**Manual:**
- `sudo vim github_git-lfs.list` -> add repositories location, save and quit.
- `sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg add git-lfs.gpg`

### [LunarG/Vulkan](https://vulkan.lunarg.com/doc/sdk/1.2.148.1/linux/getting_started_ubuntu.html)
**Manual:**
- `sudo vim lunarg-vulkan-focal.list` -> add repositories location, save and quit.
- `wget -qO - http://packages.lunarg.com/lunarg-signing-key-pub.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg add -` or  
`sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg add lunarg-signing-key-pub.asc`

### [Microsoft]() [[url 1](https://docs.microsoft.com/es-es/windows-server/administration/linux-package-repository-for-microsoft-software), [url 2](https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb)]
**Auto:**
- `sudo apt install ./packages-microsoft-prod.deb`

**Manual:**
- `sudo vim microsoft.list` -> add repositories location, save and quit.
- `sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg adv --keyserver keyserver.ubuntu.com --receive-keys BC528686B50D79E339D3721CEB3E94ADBE1229CF`  
or `wget -q -O - https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg add -`  
or `sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg add microsoft.asc`

### [Mono/Xamarin](https://www.mono-project.com/download/stable/#download-lin-ubuntu)
**Manual:**
- `sudo vim mono.list` -> add repositories location, save and quit.
- `sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg adv --keyserver keyserver.ubuntu.com --receive-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF`

### [nVidia](https://developer.nvidia.com/cuda-downloads)
**Manual:**
- Go to the link and choose _deb(network)_
- `wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin`
- `sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/nvidia`
- `sudo vim nvidia.list` -> add repositories location, save and quit.
- `sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub`  
or `sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg add nvidia.pub`

### [OpenSCAD](http://www.openscad.org/downloads.html#linux)
**Manual:**
- `sudo vim openscad.list` -> add repositories location, save and quit.
- `sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg add openscad-nightly.pub`

### [Oracle VirtualBox](https://www.virtualbox.org/wiki/Linux_Downloads)
**Manual:**
- `sudo vim oracle.list` -> add repositories location, save and quit.
- `wget -q -O - https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg add -`  
or `sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg add oracle_vbox_2016.asc`

### [SublimeText](https://www.sublimetext.com/docs/3/linux_repositories.html)
**Manual:**
- `sudo vim sublime-text.list` -> add repositories location, save and quit.
- `sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg adv --keyserver keyserver.ubuntu.com --receive-keys 1EDDE2CDFC025D17F6DA9EC0ADAE6AD28A8F901A`  
or `wget -q -O - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg add -`  
or `sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg add sublimehq-pub.gpg`

### [Fish](https://launchpad.net/~fish-shell/+archive/ubuntu/release-3)
**Auto:**
- `sudo add-apt-repository ppa:fish-shell/release-3`

**Manual:**
- `sudo vim fish-shell-ubuntu-release-3-focal.list` -> add repositories location, save and quit.
- `sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg adv --keyserver keyserver.ubuntu.com --receive-keys 59FDA1CE1B84B3FAD89366C027557F056DC33CA5`

### [FreeCAD](https://launchpad.net/~freecad-maintainers/+archive/ubuntu/freecad-stable)
**Auto:**
- `sudo add-apt-repository ppa:freecad-maintainers/freecad-stable`

**Manual:**
- `sudo vim freecad-maintainers-ubuntu-freecad-stable-focal.list` -> add repositories location, save and quit.
- `sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg adv --keyserver keyserver.ubuntu.com --receive-keys 83193AA3B52FF6FCF10A1BBF005EAE8119BB5BCA`

### [Git](https://git-scm.com/download/linux)
**Auto:**
- sudo `add-apt-repository ppa:git-core/ppa`

### [Inkscape](https://code.launchpad.net/~inkscape.dev/+archive/ubuntu/stable)
**Auto:**
- `sudo add-apt-repository ppa:inkscape.dev/stable`

**Manual:**
- `sudo vim inkscape_dev-ubuntu-stable-focal.list` -> add repositories location, save and quit.
- `sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg adv --keyserver keyserver.ubuntu.com --receive-keys 22C4850146603F3DB0ED00479DA4BD18B9A06DE3`

### [Intel](https://launchpad.net/~intel-opencl/+archive/ubuntu/intel-opencl)
**Auto:**
- `sudo add-apt-repository ppa:intel-opencl/intel-opencl`

**Manual:**
- `sudo vim intel-opencl-ubuntu-intel-opencl-focal.list` -> add repositories location, save and quit.
- `sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg adv --keyserver keyserver.ubuntu.com --receive-keys E75D0B33338407411D357F51B9732172C4830B8F`

### [Mendeley]()
**Auto:**
- NO URL, got it from .deb installer
- `sudo apt install ./mendeleydesktop_1.19.4-stable_amd64.deb`

### [PlexMediaServer]()
**Semi-Auto:**
- NO URL, got it from .deb installer
- `sudo apt install ./plexmediaserver_1.20.1.3252-a78fef9a9_amd64.deb`
- `sudo vim plexmediaserver.list` -> uncomment the "deb" line
- `wget -q https://downloads.plex.tv/plex-keys/PlexSign.key -O - | sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg add -`  
or `sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg add PlexSign.key`

### [VSCode](https://code.visualstudio.com/)
**Auto:**
- `sudo apt install ./code_1.49.2-1600965325_amd64.deb`

**Manual:**
- `sudo vim vscode.list` -> add repositories location, save and quit.
- `sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg adv --keyserver keyserver.ubuntu.com --receive-keys BC528686B50D79E339D3721CEB3E94ADBE1229CF`  
or `wget -q -O - https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg add -`  
or `sudo apt-key --keyring /etc/apt/trusted.gpg.d/apt-custom-keys.gpg add microsoft.asc`
