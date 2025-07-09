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
