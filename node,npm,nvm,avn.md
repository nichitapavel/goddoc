node, npm, nvm, avn - installation & usage
==========================================
node: a tool to execute javascript code in variety of environments.
npm: a javascript package manager
nvm: a script that manages multiple active node versions
avn: a script that manages autoloads node version

node download & install from a tarball
======================================
node has a public [repo](https://nodejs.org/dist/) that has all released versions. From this repo we will download the desired version of node.
A more friendly page et node js is their's [download page](https://nodejs.org/es/download/), here you can see what version is the latest and LTS.
For advanced users the [repo](https://nodejs.org/dist/) is a good choice, for others [download page](https://nodejs.org/es/download/) is a better fit.

Download node from repo:
  ```
  wget https://nodejs.org/dist/v10.15.3/node-v10.15.3-linux-x64.tar.xz
  ```
Extract the tarball and place it in a general available path:
  ```
  tar -xf node-v10.15.3-linux-x64.tar.xz
  sudo mv node-v10.15.3-linux-x64/ /opt/.
  ```
Create symbolic link to `node`:
  ```
  ln -s /opt/node-v10.15.3-linux-x64/bin/node ~/bin/node
  ```
  _(~/bin should be created and included into your PATH variable)_
Node comes with `npm` and `npx`, a symbolic link to them should be created too:
  ```
  ln -s /opt/node-v10.15.3-linux-x64/bin/npm ~/bin/npm
  ln -s /opt/node-v10.15.3-linux-x64/bin/npx ~/bin/npx
  ```


npm download and install
========================
**npm install from tarball**:
a version of `npm` comes with `node` tarball, but in case you want to have a different version here is how you can do it.
[Here](https://registry.npmjs.org/npm/) you'll get a json with all available versions of npm, choose what your heart tells you.
**Note**: this method uses actual npm repository, this means that all **npm cli** install comands end here to download a package.

Download `npm` tarball:
  ```
  wget https://registry.npmjs.org/npm/-/npm-6.9.0.tgz
  ```
Extract the tarball and place it in `node`:
  ```
  tar -xf npm-6.9.0.tgz
  rm -rf /opt/node-v10.15.3-linux-x64/lib/node_modules/npm/   -> [*1]
  mkdir /opt/node-v10.15.3-linux-x64/lib/node_modules/npm/    -> [*1]
  mv package/* /opt/node-v10.15.3-linux-x64/lib/node_modules/npm
  ```
Symbolic links:
  Since these steps work at best with **node** steps, there is no need to create symbolic links again, you already have it.

**npm install from npm cli**:
There is a easier version to downdate/update `npm` then using a tarball, this is posible because `node` always comes with a version of `npm`.

Update npm to latest version:
  ```
  npm install -g npm@latest
  ```
Downdate/install a specific version of npm:
  ```
  npm install -g npm@3.8.9
  ```


**npm hibrid install**:
There is the option to install `npm` from a tarball using **npm's cli**. 
This can be usefull if your target machine has no access to internet _(this things still happen? omg....)_

Download `npm` tarball:
  ```
  wget https://registry.npmjs.org/npm/-/npm-6.9.0.tgz
  ```
Install/update/downdate npm from the tarball:
  ```
  npm install -g npm-6.9.0.tgz
  ```

nvm [2]
=======
Similar to pyenv, allows to install and use different versions of node.
_.nvmrc_ - file with node version to load, each project can have it's file. Format whatever `nvm` understands, no spaces after version and a new line mandatory.

**Install**:
Just follow the instructions from the page:
  ```
  wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
  ```
Log out and in for changes to have effect.

**Commands**:
Show available versions to install:
  ```
  nvm ls-remote
  ```
Show available LTS versions to install:
  ```
  nvm ls-remote --lts
  ```
Install a version of node:
  ```
  nvm install v10.15.3
  ```
Install a version of node from source:
  ```
  nvm install -s v10.15.3
  ```
Load from _.nvmrc_ node version/alias (if it does not exists, searches in upper parents):
  ```
  nvm use
  ```
Load specific node version/alias:
  ```
  nvm use v10.15.3
  ```
Currently loaded node version:
  ```
  nvm current
  ```
Where is located currently loaded node:
  ```
  nvm which current
  ```
Where is located specific node version/aias:
  ```
  nvm which v10.15.3
  ```
Run a command/script with specific node version/alias:
  ```
  nvm run v10.15.3 --help
  ```
Disable nvm, node, npm, npx...:
  ```
  nvm deactivate
  ```

avn [1]
=======
A script that autoloads **node** version from _.node-version_ or _.nvmrc_ file.
On the bad side when you leave to an upper directory id does not go to the default node.
It also messes up bash load, I'll wait a bit before using it.

**Commands**:
Install **avn** and **avn-nvm** plugin:
  ```
  npm install -g avn avn-nvm avn-n
  ```
Enable **avn**:
  ```
  avn setup
  ```
Log out and in again, nothing more.

**Note**:
- **npm**'s global location is in _node/lib/node_modules/_, wherever `node` is installed.
- When updating/downdating `npm` is crucial to use the `-g` option, otherwise you will just install **npm** as a local package, with `-g` it will be installed in `node`'s directory.

[*1] - why remove and create the same folder? The npm folder has some hidden files (that start with **.**), to ensure that no data from the previous `npm` version remains I delete the entire folder and create it again.

[1] - https://github.com/wbyoung/avn
[2] - https://github.com/nvm-sh/nvm

OLD NOTES
=========
```
sudo apt remove nodejs

wget https://nodejs.org/download/release/latest-v10.x/node-v10.15.1-linux-armv7l.tar.gz
extract node-v10.15.1-linux-armv7l.tar.gz
sudo mv node-v10.15.1-linux-armv7l.tar.gz /opt/.

vim .profile >> 
NODE_HOME=/opt/node-v10.15.1-linux-armv7l
# set PATH so it includes nodejs in /opt if exists
if [ -d "$NODE_HOME/bin" ] ; then
    PATH="$PATH:$NODE_HOME/bin"
fi

# https://github.com/npm/cli/releases/tag/v6.7.0
wget https://github.com/npm/cli/archive/v6.7.0.tar.gz
extract cli-v6.7.0.tar.gz
mv cli-v6.7.0/ /opt/.

cd $NODE_HOME/bin
ln -s /opt/cli-6.7.0/bin/npm-cli.js npm
ln -s /opt/cli-6.7.0/bin/npx-cli.js npx

npm -> ../lib/node_modules/npm/bin/npm-cli.js
npx -> ../lib/node_modules/npm/bin/npx-cli.js
```
