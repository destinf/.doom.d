;; (after! cider
;;   (cider-auto-test-mode 1))

;; (use-package! flycheck-clojure
;;   :defer t
;;   :commands (flycheck-clojure-setup)               ;; autoload
;;   :config
;;   (eval-after-load 'flycheck
;;     '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))
;;   (add-hook 'after-init-hook #'global-flycheck-mode))
;; (after! cider (flycheck-clojure-setup))
;; (use-package! flycheck-pos-tip
;;   :defer t
;;   :after flycheck)

  (map! :map cider-repl-mode-map
        :ni "<up>" #'cider-repl-previous-input
        :ni "<down>" #'cider-repl-next-input)

(after! clojure-mode
  (setq clojure-indent-style 'align-arguments))

(use-package! counsel-dash
  :config
  (add-hook 'emacs-lisp-mode-hook (lambda () (setq-local counsel-dash-docsets '("Emacs Lisp"))))
  (add-hook 'ruby-mode-hook (lambda () (setq-local counsel-dash-docsets '("Ruby")))))

(use-package! mood-line
  :ensure t
  :config
  (mood-line-mode))

  (setq rmh-elfeed-org-files (list "~/.doom.d/elfeed.org"))

(use-package! graphviz-dot-mode
  :defer t
  :config
  (setq graphviz-dot-indent-width 4))
(use-package! company-graphviz-dot
  :after
  graphviz-dot-mode)

(use-package! prettier-js
:hook ((js2-mode-hook . prettier-js-mode)
       (web-mode-hook . prettier-js-mode)))

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;; (map!
;;       :mnoeivg "C-n" #'next-line
;;       :mnoeivg "C-p" #'previous-line
;; )

(map! :leader
      :desc "M-x" "SPC" #'execute-extended-command
      :desc "Search project" "/"
      (cond ((featurep! :completion ivy)  #'+ivy/project-search)
            ((featurep! :completion helm) #'+helm/project-search))
      (:prefix ("b" . "buffer")
        :desc "ibuffer" "i" #'ibuffer)

      (:prefix ("f")
       :desc "Toggle Treemacs" "t" #'treemacs
        :nv "y" nil)

      (:prefix "o"
        :desc "Elfeed (RSS Feed)"          "e" #'elfeed)

      (:prefix ("p")
        :desc "Find file in project" "f" #'projectile-find-file)

      (:prefix ("r" . "resume")
        :desc "Resume Ivy" "l" #'ivy-resume
        :desc "Resume Avy" "a" #'avy-resume)

      (:prefix ("s")
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
        :desc "deadgrep"                      ";" #'deadgrep)

      (:prefix ("w")
       :desc "Edit windows" "e" #'+hydra/window-nav/body)

      (:prefix ("y" . "snippets")
        :desc "New snippet"                "n" #'yas-new-snippet
        :desc "Insert snippet"             "i" #'yas-insert-snippet
        :desc "Jump to mode snippet"       "/" #'yas-visit-snippet-file
        :desc "Jump to snippet"            "s" #'+snippets/find-file
        :desc "Browse snippets"            "S" #'+snippets/browse
        :desc "Reload snippets"            "r" #'yas-reload-all)
      )
(map!
  ;; Easier window navigation
  :n "-"     #'dired-jump
  :n "C-s"   #'counsel-grep-or-swiper
  :n "gb" #'browse-url
  :n "gsr" #'avy-resume
)

(setq mac-option-modifier 'meta)

;; (setq-default evil-shift-width 2)
  (setq-default tab-width 2)

  (setq-default web-mode-code-indent-offset 2)
  (setq-default web-mode-markup-indent-offset 2)
  (setq-default web-mode-attr-indent-offset 2)
  (setq-default web-mode-attr-value-indent-offset 2)

  (setq-default typescript-indent-level 2)

(setq-default ruby-indent-level 2)

;; Set line numbers to be relative
;; (setq display-line-numbers 'relative)
;; (setq display-line-numbers-type 'relative)
;; (setq display-line-numbers-current-absolute t)
;; (global-display-line-numbers-mode t)

  ;; (if (display-graphic-p) (setq doom-theme 'doom-nord))
(load-theme 'adwaita)

(setq org-agenda-files (quote ("~/org" "~/.deft")))

(server-start)

(setq evil-emacs-state-cursor '("pink" box))
(setq evil-normal-state-cursor '("pink" box))
(setq evil-visual-state-cursor '("firebrick" box))
(setq evil-insert-state-cursor '("yellow" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

(setq-default
 delete-by-moving-to-trash t                      ; Delete files to trash
 window-combination-resize t                      ; take new window space from all other windows (not just current)
 x-stretch-cursor t)                              ; Stretch cursor to the glyph width

(setq undo-limit 80000000                         ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                         ; Nobody likes to loose work, I certainly don't
      truncate-string-ellipsis "…")               ; Unicode ellispis are nicer than "...", and also save /precious/ space

  (setq doom-font (font-spec :family "Fira Code Retina" :size 16)
        doom-variable-pitch-font (font-spec :family "Fira Code Retina" :size 14))

  ;; (menu-bar-mode -1)
  ;; (toggle-scroll-bar -1)
  ;; (tool-bar-mode -1)

(toggle-frame-maximized)
