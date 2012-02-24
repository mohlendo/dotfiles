My precious dotfiles
=====================

based on http://silas.sewell.org/blog/2009/03/08/profile-management-with-git-and-github/

Setup
-----

1. Clone your configuration repository
   `git clone git@github.com:mohlendo/dotfiles.git dotfiles.git`
   
2. Move the git metadata to `~/.dotfiles.git`
   `mv .dotfiles.git/.git .dotfiles.git`
   
3. Move your configuration files to your home directory
   `mv -i dotfiles.git/* .`
   
4. Delete the `config.git` directory
   `rmdir dotfiles.git`

Basic use
--------

* `dotfiles pull` for latest changes
* `dotfiles add -f .<some_dotfile>` to add new file (.gitignore ignores all files, so you need -f)
