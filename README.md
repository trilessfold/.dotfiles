#  GNU Stow usage
## Stow packages
<pre>
  $ stow package ...
</pre>
or
<pre>
  $ stow -R package ...
</pre>
Where the R option is restowing with deleting obsolete symlinks
## Remove packages
<pre>
  $ stow -D package ...
</pre>
Where the R option is restowing with deleting obsolete symlinks 
## REWRITE existing files
<pre>
  $ stow --adopt package ...
  $ git restore .
</pre>
