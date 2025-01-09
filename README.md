#  GNU Stow usage
## Stow all packages
<pre>
  $ stow .
</pre>
or
<pre>
  $ stow -R .
</pre>
Where the R option is restowing with deleting obsolete symlinks
## Remove all packages
<pre>
  $ stow -D .
</pre>
Where the R option is restowing with deleting obsolete symlinks 
## REWRITE all existing files from packages
<pre>
  $ stow --adopt .
  $ git restore .
  $ stow -R .
</pre>
