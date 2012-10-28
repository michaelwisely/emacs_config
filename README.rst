Wisely's emacs config
=====================

This is my emacs config stuff. Copying it around from place to place
was getting annoying... especially since each machine seems to have a
slightly differently set of emacs packages.

Credit
------

I've managed to slap together an init.el file and a little Elisp
script to install packages for me. Please refer to the authors listed
at the top of each source file to see who wrote them. All of the
packages listed in the install_packages.el file are can be found in
either ELPA or MELPA.


Setting up
----------

Clone this repository down into your ``.emacs.d/`` directory. It's
probably not a bad idea to back that up your old ``.emacs.d/`` before you
clone.

..

  git clone https://github.com/michaelwisely/emacs-config.git ~/.emacs.d/

If you're using Emacs 24, you should be fine. If you're using Emacs
23, you should download package.el into ``.emacs.d/``. Make sure you're
downloading one that's been updated for Emacs 23. Otherwise you're
going to get lots of errors about 'package-archives not being
available.

Then run the install_packages.el file. On my laptop, I was able to run
it from my bash prompt (there's a shebang at the top), but on my
desktop, I had to open it up and evaluate the buffer with ``M-x eval-buffer``
