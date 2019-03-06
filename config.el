;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-
(def-package! rvm)
(rvm-use-default)
(def-package! helm-dash)

(after! avy
  (setq avy-all-windows 'all-frames))
;; This is my leader config which overrides some of the other leader configs
;; in default doom-emacs

(map! :leader
      ;; Jump Mode, prefix j
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
      :desc "Search project" "/"
      (cond ((featurep! :completion ivy)  #'+ivy/project-search)
            ((featurep! :completion helm) #'+helm/project-search))
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
; (setq display-line-numbers "relative") ;THIS DOESN'T WORK
(setq mac-option-modifier 'meta)
(setq which-key-idle-delay 0.2)
(add-hook 'ruby-mode #'(lambda () (modify-syntax-entry ?_ "w")))
; https://sam217pa.github.io/2016/09/02/how-to-build-your-own-spacemacs/
