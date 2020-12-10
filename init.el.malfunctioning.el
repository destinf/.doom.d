;;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load in.
;; Remember to run 'doom sync' after modifying it!

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find information about all of Doom's modules
;;      and what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c g k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).
;;
;;      Alternatively, press 'gd' (or 'C-c g d') on a module to browse its
;;      directory (for easy access to its source code).

(doom! :input
       chinese

       :completion
       company           ; the ultimate code completion backend
       ivy               ; a search engine for love and life

       :ui
       deft              ; notational velocity for Emacs
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       doom-quit         ; DOOM quit-message prompts when you quit Emacs
       (emoji +unicode)  ; 🙂
       fill-column       ; a `fill-column' indicator
       hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       hydra
       indent-guides     ; highlighted indent columns
       ligatures         ; ligatures and symbols to make your code pretty again
       minimap           ; show a map of the code on the side
       modeline          ; snazzy, Atom-inspired modeline, plus API
       nav-flash         ; blink the current line after jumping
       ophints           ; highlight the region an operation acts on
       (popup +all +defaults)   ; tame sudden yet inevitable temporary windows
       treemacs          ; a project drawer, like neotree but cooler
       unicode           ; extended unicode support for various languages
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       window-select     ; visually switch windows
       workspaces        ; tab emulation, persistence & separate workspaces
       zen               ; distraction-free coding or writing

       :editor
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
       lispy             ; vim for lisp, for people who don't like vim
       multiple-cursors  ; editing in many places at once
       rotate-text       ; cycle region at point between text candidates
       snippets          ; my elves. They type so I don't have to
       word-wrap         ; soft wrapping with language-aware indent

       :emacs
       dired             ; making dired pretty [functional]
       electric          ; smarter, keyword-based electric-indent
       ibuffer           ; interactive buffer management
       (undo +tree)              ; persistent, smarter undo for your inevitable mistakes
       vc                ; version-control and Emacs, sitting in a tree

       :term
       vterm             ; another terminals in Emacs

       :checkers
       syntax            ; tasing you for every semicolon you forget
       (spell +aspell +everywhere)
       grammar           ; tasing grammar mistake every you make

       :tools
       ansible
       docker
       editorconfig      ; let someone else argue about tabs vs spaces
       ein               ; tame Jupyter notebooks with emacs
       (eval +overlay)     ; run code, run (also, repls)
       gist              ; interacting with github gists
       lookup              ; navigate your code and its documentation
       lsp
       magit             ; a git porcelain for Emacs
       make              ; run make tasks from Emacs
       pdf               ; pdf enhancements
       rgb               ; creating color strings
       taskrunner
       terraform         ; infrastructure as code
       tmux              ; an API for interacting with tmux
       upload            ; map local to remote projects via ssh/ftp

       :os
       (:if IS-MAC macos)  ; improve compatibility with macOS
       tty               ; improve the terminal Emacs experience

       :lang
       cc                ; C/C++/Obj-C madness
       clojure           ; java with a lisp
       data              ; config/data formats
       elixir            ; erlang done right
       emacs-lisp        ; drown in parentheses
       (go +lsp)         ; the hipster dialect
       (javascript +lsp)        ; all(hope(abandon(ye(who(enter(here))))))
       json              ; At least it ain't XML
       markdown          ; writing docs for people to ignore
       (org              ; organize your plain life in plain text
        +dragndrop       ; drag & drop files/images into org buffers
        +hugo            ; use Emacs for hugo blogging
        +jupyter        ; ipython/jupyter support for babel
        +pandoc          ; export-with-pandoc support
        +pomodoro        ; be fruitful with the tomato technique
        +present)        ; using org-mode for presentations
       php               ; perl's insecure younger brother
       python            ; beautiful is better than ugly
       rest              ; Emacs as a REST client
       (ruby
          +lsp
          +rails
          +rvm)          ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       sh                ; she sells {ba,z,fi}sh shells on the C xor
       web               ; the tubes
       yaml              ; JSON, but readable

       ;; :email
       ;; (mu4e +gmail)

       :app
       ;; irc               ; how neckbeards socialize
       (rss +org)        ; emacs as an RSS reader
       ;; twitter           ; twitter client https://twitter.com/vnought

       ;; :config
       literate
       (default +bindings +smartparens))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1897b97f63e91a792e8540c06402f29d5edcbfb0aafd64b1b14270663d6868ee" "c6b93ff250f8546c7ad0838534d46e616a374d5cb86663a9ad0807fd0aeb1d16" "5a411e7cb2d7955b28c514cd5b75782c6dd4ba027089fec17a2573405b0fdd5c" "b60f08ddc98a95485ec19f046a81d5877b26ab80a67782ea5b91a00ea4f52170" "eb94e44599a45c495ad472ad551a40b87cbc4bae9631211e7a78d72b102c61b1" "1ca1f43ca32d30b05980e01fa60c107b02240226ac486f41f9b790899f6f6e67" "a02836a5807a687c982d47728e54ff42a91bc9e6621f7fe7205b0225db677f07" "fa1fa0bc00fc80f5466cfd6b595e4a010d0c1953b7f135fd2658ca93ff8c8a17" "423435c7b0e6c0942f16519fa9e17793da940184a50201a4d932eafe4c94c92d" "2d1fe7c9007a5b76cea4395b0fc664d0c1cfd34bb4f1860300347cdad67fb2f9" "fefab1b6d3366a959c78b4ed154018d48f4ec439ce652f4748ef22945ca7c2d5" "7f74a3b9a1f5e3d31358b48b8f8a1154aab2534fae82c9e918fb389fca776788" "c8f959fb1ea32ddfc0f50db85fea2e7d86b72bb4d106803018be1c3566fd6c72" "f2b83b9388b1a57f6286153130ee704243870d40ae9ec931d0a1798a5a916e76" default)))
 '(flycheck-checker-error-threshold 800)
 '(js-indent-level 2)
 '(json-reformat:indent-width 2)
 '(org-agenda-files
   (quote
    ("~/org/boon/tasks.org" "/Users/destin/org/flexepin.org" "/Users/destin/org/ideas.org" "/Users/destin/org/microservices_flow.org" "/Users/destin/org/notes.org" "/Users/destin/org/seo.org" "/Users/destin/org/todo.org", "~/.deft/")))
 '(tab-width 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
