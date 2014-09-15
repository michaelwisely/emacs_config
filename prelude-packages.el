;; From http://batsov.com/articles/2012/02/19/package-management-in-emacs-the-good-the-bad-and-the-ugly/

(require 'package)
(package-initialize)

(defvar prelude-packages
  '(angular-snippets auctex bison-mode dash django-mode elixir-mode
                     flymake-coffee flymake-cursor flymake-python-pyflakes
                     flymake-easy gitattributes-mode gitconfig-mode
                     gitignore-mode go-mode haskell-mode hl-todo less-css-mode
                     literate-coffee-mode coffee-mode magit git-rebase-mode
                     git-commit-mode markdown-mode mustache-mode pandoc-mode
                     pony-mode s yaml-mode yasnippet)
  "A list of packages to ensure are installed at launch.")

(defun prelude-packages-installed-p ()
  (loop for p in prelude-packages when (not (package-installed-p p)) do
        (return
         nil)
        finally
        (return
         t)))

(defun install-missing-packages ()
  (unless (prelude-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs Prelude is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")

    ;; install the missing packages
    (dolist (p prelude-packages)
      (when (not (package-installed-p p))
        (message "%s" (format "Installing %s" p))
        (package-install p)))))


(provide 'prelude-packages)
;;; prelude-packages.el ends here
