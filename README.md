## Bundle of my dotfiles ##

## Files ##

* .ackrc
* .profile
* .gitignore
* .gitconfig

## Installation ##

Clone this repo with:

    git clone git://github.com/pinifloyd/.dotfiles.git ~/.dotfiles

And run bootstrap.rb script:

    cd ~/.dotfiles && ruby bootstrap.rb

Every time when you run bootstrap script it making backup for existing files in
list above. You can see it in ```~/.dotfiles/backup/``` . Don't forget to clean
this folder when you done :)
