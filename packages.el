;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

(package! rvm)
(package! helm-dash)
(package! avy)
(package! coffee-mode)
(package! auto-dictionary)
(package! yasnippet-snippets)
(package! emacs-snippets
  :recipe (:fetcher github
           :repo "hlissner/emacs-snippets"
           :files ("*")))
(package! multiple-cursors)
(package! git-link)
(package! ggtags)
(package! flx)
(package! tss)
(package! tide)
(package! typescript-mode)
(package! deadgrep)
