;;; init.el -*- lexical-binding: t; -*-

(doom! :input
       :completion
       company           ; the ultimate code completion backend
       ivy              ; a search engine for love and life

       :ui
       deft              ; notational velocity for Emacs
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       hl-todo           ; highlight TODO/FIXME/NOTE tags
       hydra
       indent-guides     ; highlighted indent columns
       modeline          ; snazzy, Atom-inspired modeline, plus API
       nav-flash         ; blink the current line after jumping
       ophints           ; highlight the region an operation acts on
       (popup            ; tame sudden yet inevitable temporary windows
        +all             ; catch all popups that start with an asterix
        +defaults)       ; default popup rules
       unicode           ; extended unicode support for various languages
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       window-select     ; visually switch windows
       workspaces        ; tab emulation, persistence & separate workspaces

       :editor
       (evil +everywhere); come to the dark side, we have cookies
       ;; evil
       fold              ; (nigh) universal code folding
       ;; god            ; god mode. Conflict with evil
       multiple-cursors  ; editing in many places at once
       rotate-text       ; cycle region at point between text candidates
       snippets          ; my elves. They type so I don't have to

       :emacs
       (dired            ; making dired pretty [functional]
        ;; +ranger
        +icons)
       vc                ; version-control and Emacs, sitting in a tree

       :term
       ;; eshell            ; a consistent, cross-platform shell (WIP)
       shell             ; a terminal REPL for Emacs
       term              ; terminals in Emacs
       ;; vterm             ; another terminals in Emacs

       :tools
       ansible
       debugger
       eval              ; run code, run (also, repls)
       flycheck          ; tasing you for every semicolon you forget
       flyspell          ; tasing you for misspelling mispelling
       gist              ; interacting with github gists
       (lookup           ; helps you navigate your code and documentation
        +docsets)        ; ...or in Dash docsets locally
       lsp
       macos             ; MacOS-specific commands
       magit             ; a git porcelain for Emacs
       make

       :lang
       cc
       data              ; config/data formats
       emacs-lisp        ; drown in parentheses
       javascript        ; all(hope(abandon(ye(who(enter(here))))))
       markdown          ; writing docs for people to ignore
       nix               ; I hereby declare "nix geht mehr!"
       (org              ; organize your plain life in plain text
        +dragndrop       ; file drag & drop support
        +ipython         ; ipython support for babel
        +pandoc          ; pandoc integration into org's exporter
        +present)        ; using Emacs for presentations
       php
       python            ; beautiful is better than ugly
       rest              ; Emacs as a REST client
       ruby              ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       sh                ; she sells {ba,z,fi}sh shells on the C xor
       web               ; the tubes

       ;; Applications are complex and opinionated modules that transform Emacs
       ;; toward a specific purpose. They may have additional dependencies and
       ;; should be loaded late.
       :app
       calendar
       ;;irc              ; how neckbeards socialize
       (rss +org)        ; emacs as an RSS reader
       twitter           ; twitter client https://twitter.com/vnought
       (write            ; emacs as a word processor (latex + org + markdown)
        +wordnut         ; wordnet (wn) search
        +langtool)       ; a proofreader (grammar/style check) for Emacs

       :config
       ;; For literate config users. This will tangle+compile a config.org
       ;; literate config in your `doom-private-dir' whenever it changes.
       literate

       ;; The default module sets reasonable defaults for Emacs. It also
       ;; provides a Spacemacs-inspired keybinding scheme and a smartparens
       ;; config. Use it as a reference for your own modules.
       (default +bindings +smartparens))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1897b97f63e91a792e8540c06402f29d5edcbfb0aafd64b1b14270663d6868ee" "c6b93ff250f8546c7ad0838534d46e616a374d5cb86663a9ad0807fd0aeb1d16" "5a411e7cb2d7955b28c514cd5b75782c6dd4ba027089fec17a2573405b0fdd5c" "b60f08ddc98a95485ec19f046a81d5877b26ab80a67782ea5b91a00ea4f52170" "eb94e44599a45c495ad472ad551a40b87cbc4bae9631211e7a78d72b102c61b1" "1ca1f43ca32d30b05980e01fa60c107b02240226ac486f41f9b790899f6f6e67" "a02836a5807a687c982d47728e54ff42a91bc9e6621f7fe7205b0225db677f07" "fa1fa0bc00fc80f5466cfd6b595e4a010d0c1953b7f135fd2658ca93ff8c8a17" "423435c7b0e6c0942f16519fa9e17793da940184a50201a4d932eafe4c94c92d" "2d1fe7c9007a5b76cea4395b0fc664d0c1cfd34bb4f1860300347cdad67fb2f9" "fefab1b6d3366a959c78b4ed154018d48f4ec439ce652f4748ef22945ca7c2d5" "7f74a3b9a1f5e3d31358b48b8f8a1154aab2534fae82c9e918fb389fca776788" "c8f959fb1ea32ddfc0f50db85fea2e7d86b72bb4d106803018be1c3566fd6c72" "f2b83b9388b1a57f6286153130ee704243870d40ae9ec931d0a1798a5a916e76" default)))
 '(enh-ruby-indent-level 2)
 '(flycheck-checker-error-threshold 800)
 '(js-indent-level 2)
 '(json-reformat:indent-width 2)
 '(org-agenda-files
   (quote
    ("~/org/boon/tasks.org" "/Users/destin/org/flexepin.org" "/Users/destin/org/ideas.org" "/Users/destin/org/microservices_flow.org" "/Users/destin/org/notes.org" "/Users/destin/org/seo.org" "/Users/destin/org/todo.org")))
 '(tab-width 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
