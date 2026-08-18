#  GNU Stow usage
## Stow all packages
``` bash
    $ stow .
```
or
``` bash
    $ stow -R .

```
Where the R option is restowing with deleting obsolete symlinks

## Remove all packages
``` bash
    $ stow -D .
```
Where the R option is restowing with deleting obsolete symlinks 

## REWRITE all existing files from packages
``` bash
    $ stow --adopt .
    $ git restore .
    $ stow -R .
```

# Nix packages
All user CLI tools are described in `dev.nix` (stowed as `~/dev.nix`).
Install/sync everything with one command (replaces the whole nix profile
with the contents of dev.nix):
``` bash
    $ nix-env -irf ~/dev.nix
```
Update to fresh versions:
``` bash
    $ nix-channel --update && nix-env -irf ~/dev.nix
```
