;; Set up package.el
(add-to-list 'load-path "~/.emacs.d/")
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/pony-mode/src")

;; Imports
(require 'pony-mode)
(require 'key-chord)
(require 'yasnippet)
(require 'wc-mode)

;; set global modes
(display-time-mode 1)
(column-number-mode 1)
(show-paren-mode 1)
(global-font-lock-mode 1)
(rainbow-delimiters-mode 1)
(yas-global-mode 1)
(wc-mode 1)
(guru-global-mode 1)
(golden-ratio-enable)

;; Set global variables
(setq default-tab-width 4)
(setq scroll-step 1)
(setq require-final-newline 't)

;; Set hooks
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook 'gofmt-before-save)

;; Set theme
(load-theme 'zenburn 't)

;; Set up key chords
;; (key-chord-mode 1)
;; (key-chord-define-global "jk" 'forward-word)
;; (key-chord-define-global "df" 'backward-word)

;; Configure C/C++ style
(setq-default c-default-style "linux" c-basic-offset 2)
(c-set-offset 'inline-open 0)

;; Set up Flex/Bison modes
(autoload 'make-regexp "make-regexp"
  "Return a regexp to match a string item in STRINGS.")
(autoload 'make-regexps "make-regexp"
  "Return a regexp to REGEXPS.")

(autoload 'bison-mode "bison-mode")
(add-to-list 'auto-mode-alist '("\\.y$" . bison-mode))

(autoload 'flex-mode "flex-mode")
(add-to-list 'auto-mode-alist '("\\.l$" . flex-mode))

;; Set up Python flymake
(add-to-list 'load-path "~/.emacs.d/flymake")
(when (load "flymake" t)
  (defun flymake-pylint-init ()
	(let* ((temp-file (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
	   (local-file (file-relative-name temp-file (file-name-directory buffer-file-name)))
	   )
	  (list "~/.emacs.d/flymake/pyflymake.py" (list local-file)))
	)
  (add-to-list 'flymake-allowed-file-name-masks '("\\.py\\'" flymake-pylint-init)))

(add-hook 'find-file-hook 'flymake-find-file-hook)
