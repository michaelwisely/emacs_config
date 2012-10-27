#!/usr/bin/env emacs --script

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defvar my-packages
  '(auctex
	coffee-mode
	flymake-css
	flymake-cursor
	go-mode
	golden-ratio
	guru-mode
	haskell-mode
	js2-mode
	less-css-mode
	magit
	nginx-mode
	rainbow-delimiters
	rainbow-mode
	undo-tree
	wc-mode
	yaml-mode
	yasnippet
	zenburn-theme))

(defun install-if-missing (package)
  "Install the package if it isn't already installed"
  (when (not (package-installed-p package))
	(package-install package))
  )

(message (let ((result (delq nil (mapcar 'install-if-missing my-packages)))
			   )
		   (if (identity result)
			   (identity result)
			 (identity "Everything's installed."))))
