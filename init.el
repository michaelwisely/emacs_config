(add-to-list 'load-path "~/.emacs.d/")

(require 'elisp-format)
(require 'prelude-packages)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(TeX-view-program-list (quote (("Default Viewer" "open %o"))))
 '(TeX-view-program-selection (quote (((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdvi") (output-pdf "Default Viewer") (output-html "xdg-open"))))
 '(coffee-tab-width 4)
 '(column-number-mode t)
 '(elisp-format-column 80)
 '(flymake-coffee-coffeelint-configuration-file "/Users/mwwcp2/.coffeelint.json")
 '(indent-tabs-mode nil)
 '(js-indent-level 2)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("melpa" . "http://melpa.milkbox.net/packages/") ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(require-final-newline t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(install-missing-packages)

;; Python Flymake
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

;; Go fmt hook
(add-hook 'before-save-hook 'gofmt-before-save)

;; Clean up whitespace
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Coffeelint coffee files
(add-hook 'coffee-mode-hook 'flymake-coffee-load)

(add-hook 'markdown-mode-hook
          (lambda ()
            (flyspell-mode)))

;; Use YAML mode on .yaml files
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
