(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'elisp-format)
(require 'prelude-packages)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(TeX-view-program-list (quote (("Default Viewer" "open %o"))))
 '(TeX-view-program-selection
   (quote
    (((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Default Viewer")
     (output-html "xdg-open"))))
 '(c-basic-offset 2)
 '(c-default-style
   (quote
    ((c++-mode . "linux")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu"))))
 '(coffee-tab-width 4)
 '(column-number-mode t)
 '(elisp-format-column 80)
 '(flymake-coffee-coffeelint-configuration-file (expand-file-name "~/.coffeelint.json"))
 '(indent-tabs-mode nil)
 '(js-indent-level 4)
 '(org-agenda-files (directory-files "~/code/todo" t "\\.org" nil))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/")
     )))
 '(require-final-newline t)
 '(scss-compile-at-save nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(install-missing-packages)

;; Set up global shortcuts for Org
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Python Flymake
(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'python-mode-hook 'flyspell-prog-mode)

;; Go fmt hook
(add-hook 'before-save-hook 'gofmt-before-save)

;; Clean up whitespace on save
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Coffeelint coffee files
(add-hook 'coffee-mode-hook 'flymake-coffee-load)

;; Haskell indentation
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; Spell check
(add-hook 'markdown-mode-hook
          (lambda ()
            (flyspell-mode)))
(add-hook 'org-mode-hook
          (lambda ()
            (flyspell-mode)))
