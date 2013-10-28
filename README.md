# Patrick's Tilde-tastic configurama
## Installation

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/projects/dotfiles`, with `~/dotfiles` as a symlink.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/patrickkettner/dotfiles.git && cd dotfiles && source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/patrickkettner/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,LICENSE-MIT.txt}
```

To update later on, just run that command again.


## Thanks to…
[mathias bynens](https://github.com/mathiasbynens/dotfiles), [paul irish](https://github.com/paulirish/dotfiles), and all the people they copied from
