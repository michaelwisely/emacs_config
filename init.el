;; Set up package.el
(add-to-list 'load-path "~/.emacs.d/")
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/flex_bison/")
(add-to-list 'load-path "~/.emacs.d/pony-mode/src")
(add-to-list 'load-path "/usr/local/go/misc/emacs")

;; Imports
(require 'pony-mode)
(require 'yasnippet)
(require 'wc-mode)
(require 'go-mode)
(require 'whitespace)

;; Set global variables
(setq scroll-step 1)
(setq require-final-newline 't)
(setq-default indent-tabs-mode nil)
(setq whitespace-style '(face empty tabs lines-tail trailing))

;; set global modes
(display-time-mode 1)
(column-number-mode 1)
(show-paren-mode 1)
(global-font-lock-mode 1)
(yas-global-mode 1)
(wc-mode 1)
;; (guru-global-mode 1)
(global-rainbow-delimiters-mode)
(global-whitespace-mode t)

;; Set filename modes
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

;; Set hooks
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'haskell-mode-hook 'flymake-hlint-load)

;; Configure C/C++ style
(setq c-default-style "k&r"
      c-basic-offset 8)

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
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(haskell-mode-hook (quote (turn-on-haskell-indentation)) t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(flymake-errline ((((class color) (background light)) (:background "Red" :foreground "black"))))
 '(flymake-infoline ((((class color) (background light)) (:background "LightGreen" :foreground "black"))))
 '(flymake-warnline ((((class color) (background light)) (:background "LightBlue2" :foreground "black"))))
 '(whitespace-space ((((class color) (background light)) (:foreground "DarkGray"))))
 '(whitespace-tab ((((class color) (background light)) (:background "lightgray" :foreground "lightgray")))))
