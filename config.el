;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-
(def-package! rvm)
(rvm-use-default)
(def-package! helm-dash)

(after! avy
  (setq-default avy-all-windows 'all-frames))
(map! :leader
	:desc "Jump mode" :prefix "j"
:desc "avy-goto-char-2" :nv "j" #'avy-goto-char-2
)
(after! evil
  (load! "+evil-org"))

(def-package! coffee-mode)
(def-package! auto-dictionary)
(add-hook 'flyspell-mode-hook (lambda () (auto-dictionary-mode 1)))

(defadvice xref-find-definitions (before c-tag-file activate)
  "Automatically create tags file."
  (let ((tag-file (concat default-directory "TAGS")))
    (unless (file-exists-p tag-file)
      (shell-command "etags *.[ch] -o TAGS 2>/dev/null"))
    (visit-tags-table tag-file)))
;; (setq-default display-line-numbers 'relative) ;THIS DOESN'T WORK
(setq mac-option-modifier 'meta)
(setq which-key-idle-delay 0.5)
(add-hook 'enh-ruby-mode-hook '(lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'yard-mode)
; https://sam217pa.github.io/2016/09/02/how-to-build-your-own-spacemacs/
(setq-local imenu-create-index-function #'ggtags-build-imenu-index)

(setq-default tab-width 2)
(setq-default evil-shift-width 2)
(after! flycheck
  (setq-default global-flycheck-mode nil)) ; just

(map!
 ;; Easier window navigation
 :n "C-h"   #'evil-window-left
 :n "C-j"   #'evil-window-down
 :n "C-k"   #'evil-window-up
 :n "C-l" #'evil-window-right
)
