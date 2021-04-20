;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

(package! auto-dictionary)
(package! counsel-dash)
(package! git-link)
(package! mood-line)
(package! graphviz-dot-mode)
(package! org-jira)
(package! prettier-js)
(package! rvm)
(package! tss)
(package! info-colors)
(package! info-colors :pin "47ee73cc19b1049eef32c9f3e264ea7ef2aaf8a5    aa") ; Makes manual pages nicer to look at
(package! vlf :recipe (:host github :repo "m00natic/vlfi" :files ("*.el"))
  :pin "cc02f2533782d6b9b628cec7e2dcf25b2d05a27c" :disable t) ;; Open large files without dying

;; Themes
(package! melancholy-theme)
(package! doom-themes)
(package! color-theme-modern)
