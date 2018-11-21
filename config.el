;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-
(def-package! rvm)
(rvm-use-default)
(def-package! helm-dash)

(after! avy
  (setq avy-all-windows 'all-frames))
(map! :leader
	:desc "Jump mode" :prefix "j"
:desc "avy-goto-char-2" :nv "j" #'avy-goto-char-2
)
(load! "+evil-org")

(def-package! coffee-mode)
(def-package! auto-dictionary)
(add-hook 'flyspell-mode-hook (lambda () (auto-dictionary-mode 1)))

(defadvice xref-find-definitions (before c-tag-file activate)
  "Automatically create tags file."
  (let ((tag-file (concat default-directory "TAGS")))
    (unless (file-exists-p tag-file)
      (shell-command "etags *.[ch] -o TAGS 2>/dev/null"))
    (visit-tags-table tag-file)))
; (setq display-line-numbers "relative") ;THIS DOESN'T WORK
(setq mac-option-modifier 'meta)
(setq which-key-idle-delay 0.5)
(add-hook 'ruby-mode #'(lambda () (modify-syntax-entry ?_ "w")))
