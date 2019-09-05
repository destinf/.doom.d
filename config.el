(def-package! rvm)
(rvm-use-default)

;; (load! "lisp/awesome-tab/awesome-tab")
;; (awesome-tab-mode t)

(def-package! helm-dash)

(after! avy
  (setq avy-all-windows 'all-frames))

(def-package! coffee-mode)

(def-package! auto-dictionary)
(add-hook 'flyspell-mode-hook (lambda () (auto-dictionary-mode 1)))

(defadvice xref-find-definitions (before c-tag-file activate)
  "Automatically create tags file."
  (let ((tag-file (concat default-directory "TAGS")))
    (unless (file-exists-p tag-file)
      (shell-command "etags *.[ch] -o TAGS 2>/dev/null"))
    (visit-tags-table tag-file)))

(setq which-key-idle-delay 0.2)

(add-hook 'enh-ruby-mode-hook '(lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'yard-mode)

(add-hook 'js-mode-hook (lambda() (setq js-indent-level 2)))`

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1))

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

; https://sam217pa.github.io/2016/09/02/how-to-build-your-own-spacemacs/
(setq-local imenu-create-index-function #'ggtags-build-imenu-index)

(after! flycheck
  (setq-default global-flycheck-mode nil)) ; just

;; (setq-default evil-escape-key-sequence "fd")

;; (setq ivy-re-builders-alist
;;       '((counsel-rg . ivy--regex-plus)
;;         (counsel-ag . ivy--regex-plus)
;;         (counsel-pt . ivy--regex-plus)
;;         (t . ivy--regex-fuzzy)))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

(after! magit
  (setq magit-pre-refresh-hook nil)
  (setq magit-refresh-staus-buffer nil))

(map! :n "gb" #'browse-url)
(map! :leader
      :desc "Eval" ":" #'eldoc-eval-expression
      :desc "M-x" "SPC" #'execute-extended-command
      :desc "Search project" "/"
      (cond ((featurep! :completion ivy)  #'+ivy/project-search)
            ((featurep! :completion helm) #'+helm/project-search))

      (:prefix ("j" . "jump")
        :desc "avy-goto-char-2" :nv "c" #'avy-goto-char-2
        :desc "avy-goto-line" :nv "l" #'avy-goto-line
        :desc "avy-goto-char-timer" :nv "j" #'avy-goto-char-timer)

      (:prefix ("y" . "snippets")
          :desc "New snippet"                "n" #'yas-new-snippet
          :desc "Insert snippet"             "i" #'yas-insert-snippet
          :desc "Jump to mode snippet"       "/" #'yas-visit-snippet-file
          :desc "Jump to snippet"            "s" #'+snippets/find-file
          :desc "Browse snippets"            "S" #'+snippets/browse
          :desc "Reload snippets"            "r" #'yas-reload-all)

      (:prefix ("r" . "resume")
        :desc "Resume Ivy"                   "l" #'ivy-resume)
      (:prefix ("s" . "search")
        "/" nil
        "n" nil
        "r" nil
        "s" nil
        "S" nil
        :desc "Jump to symbol across buffers" "I" #'imenu-anywhere
        :desc "Search buffer"                 "b" #'swiper
        :desc "Search current directory"      "d"
        (cond ((featurep! :completion ivy)  #'+ivy/project-search-from-cwd)
              ((featurep! :completion helm) #'+helm/project-search-from-cwd))
        :desc "Jump to symbol"                "i" #'imenu
        :desc "Jump to link"                  "l" #'ace-link
        :desc "Look up online"                "o" #'+lookup/online-select
        :desc "Search project"                "p"
        (cond ((featurep! :completion ivy)  #'+ivy/project-search)
              ((featurep! :completion helm) #'+helm/project-search))
        :desc "deadgrep"                      ";" #'deadgrep
        )
      (:prefix ("p")
        :desc "Find file in project" "f" #'projectile-find-file)
      (:prefix ("f")
        :desc "Toggle Treemacs" "t" #'treemacs)
      )
(map!
 ;; Easier window navigation
 :n "-"     #'dired-jump
 :n "C-s"   #'counsel-grep-or-swiper
)

(setq mac-option-modifier 'meta)

(setq-default tab-width 2)
(setq-default evil-shift-width 2)

;; Set line numbers to be relative
(setq display-line-numbers 'relative)
(setq display-line-numbers-type 'relative)
(setq display-line-numbers-current-absolute t)
(global-display-line-numbers-mode t)
