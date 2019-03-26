;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-
(def-package! rvm)
(rvm-use-default)
(def-package! helm-dash)

(after! avy
  (setq avy-all-windows 'all-frames))
;; This is my leader config which overrides some of the other leader configs
;; in default doom-emacs

(map! :leader
      :desc "Eval" ":" #'eldoc-eval-expression
      :desc "M-x" "SPC" #'execute-extended-command
      :desc "Search project" "/"
      (cond ((featurep! :completion ivy)  #'+ivy/project-search)
            ((featurep! :completion helm) #'+helm/project-search))

      (:prefix ("j" . "jump")
        :desc "avy-goto-char-2" :nv "j" #'avy-goto-char-2)

      (:prefix ("y" . "snippets")
          :desc "New snippet"                "n" #'yas-new-snippet
          :desc "Insert snippet"             "i" #'yas-insert-snippet
          :desc "Jump to mode snippet"       "/" #'yas-visit-snippet-file
          :desc "Jump to snippet"            "s" #'+snippets/find-file
          :desc "Browse snippets"            "S" #'+snippets/browse
          :desc "Reload snippets"            "r" #'yas-reload-all)

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
              ((featurep! :completion helm) #'+helm/project-search)))
      (:prefix ("p")
        :desc "Find file in project" "f" #'projectile-find-file)
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
(setq mac-option-modifier 'meta)
(setq which-key-idle-delay 0.2)
(add-hook 'enh-ruby-mode-hook '(lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'yard-mode)
; https://sam217pa.github.io/2016/09/02/how-to-build-your-own-spacemacs/
(setq-local imenu-create-index-function #'ggtags-build-imenu-index)

(setq-default tab-width 2)
(setq-default evil-shift-width 2)
(after! flycheck
  (setq-default global-flycheck-mode nil)) ; just
(setq-default evil-escape-key-sequence "fd")
(setq ivy-re-builders-alist
      '((t . ivy--regex-fuzzy)))
(after! magit
  (setq magit-pre-refresh-hook nil)
  (setq magit-refresh-staus-buffer nil))

;; Set line numbers to be relative
(setq display-line-numbers 'relative)
(setq display-line-numbers-type 'relative)
(setq display-line-numbers-current-absolute t)
(global-display-line-numbers-mode t)

;; Begin Tide setup
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
;; End Tide setup


(map!
 ;; Easier window navigation
 :n "C-h"   #'evil-window-left
 :n "C-j"   #'evil-window-down
 :n "C-k"   #'evil-window-up
 :n "C-l"   #'evil-window-right
 :n "-"     #'dired-jump
)
