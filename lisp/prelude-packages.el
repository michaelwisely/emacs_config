;; From http://batsov.com/articles/2012/02/19/package-management-in-emacs-the-good-the-bad-and-the-ugly/

(require 'package)
(package-initialize)

(defvar prelude-packages
  '(angular-snippets auctex bison-mode cm-mode coffee-mode csharp-mode ctable
                     dash django-mode dockerfile-mode elixir-mode elm-mode ess
                     ess-R-data-view flymake-coffee flymake-cursor flymake-easy
                     flymake-python-pyflakes git-commit-mode git-rebase-mode
                     gitattributes-mode gitconfig-mode gitignore-mode go-mode
                     haml-mode haskell-mode hl-todo hyde julia-mode
                     less-css-mode literate-coffee-mode magit markdown-mode
                     matlab-mode mustache-mode org pandoc-mode pony-mode popup
                     rust-mode s sass-mode scss-mode yaml-mode yasnippet)
  "A list of packages to ensure are installed at launch.")

(defun prelude-packages-installed-p ()
  "Checks to see whether all packages in prelude-packages are installed"
  (loop for p in prelude-packages when (not (package-installed-p p)) do
        (return
         nil)
        finally
        (return
         t)))

(defun prelude-missing-packages ()
  "Lists packages that are installed but not in prelude-packages"
  (cl-set-difference package-activated-list prelude-packages))

(defun install-missing-packages ()
  "Installs all packages from prelude-packages that are not currently installed"
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
