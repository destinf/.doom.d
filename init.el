;;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load
;; in. Remember to run 'doom sync' after modifying it!

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find a "Module Index" link where you'll find
;;      a comprehensive list of Doom's modules and what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c c k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).
;;
;;      Alternatively, press 'gd' (or 'C-c c d') on a module to browse its
;;      directory (for easy access to its source code).

;; This file controls what Doom modules are enabled and what order they load in.
;; Press 'K' on a module to view its documentation, and 'gd' to browse its directory.

(doom! :completion
       (company                    ; the ultimate code completion backend
        +childframe)               ; ... when your children are better than you
       ivy
       ;; helm                        ; the *other* search engine for love and life

       :ui
       deft                        ; notational velocity for Emacs
       ;; doom                     ; what makes DOOM look the way it does
       ;; NOTE with unicode enabled here, may cause emacs to crash if `:ui unicode` isn't enabled
       (emoji +unicode)            ; 🙂
       hl-todo                     ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       ;; (ligatures +extra)          ; ligatures and symbols to make your code pretty again
       
       ;; NOTE: modeline causes display issues with errors:
       ;; Error during redisplay: (eval (doom-modeline-segment--checker)) signaled (wrong-type-argument plistp doom-modeline-debug)
       ;; Error during redisplay: (eval (doom-modeline-segment--checker)) signaled (wrong-type-argument plistp doom-modeline-warning)
       ;; modeline                 ; snazzy, Atom-inspired modeline, plus API
       ;; nav-flash                   ; blink the current line after jumping
       ophints                     ; highlight the region an operation acts on
       (popup                      ; tame sudden yet inevitable temporary windows
        +all                       ; catch all popups that start with an asterix
        +defaults)                 ; default popup rules
       ;; treemacs                 ; a project drawer, like neotree but cooler
       unicode                     ; extended unicode support for various languages
       vc-gutter                   ; vcs diff in the fringe
       vi-tilde-fringe             ; fringe tildes to mark beyond EOB
       (window-select +numbers)    ; visually switch windows
       workspaces                  ; tab emulation, persistence & separate workspaces
       ;; zen                      ; distraction-free coding or writing

       :editor
       (evil +everywhere)          ; come to the dark side, we have cookies
       ;; file-templates           ; auto-snippets for empty files
       fold                        ; (nigh) universal code folding
       format                      ; automated prettiness
       lispy                       ; vim for lisp, for people who don't like vim
       ;; multiple-cursors            ; editing in many places at once
       ;;objed                        ; text object editing for the innocent
       ;;parinfer                     ; turn lisp into python, sort of
       rotate-text                 ; cycle region at point between text candidates
       snippets                    ; my elves. They type so I don't have to
       word-wrap                   ; soft wrapping with language-aware indent

       :emacs
       (dired +icons)              ; making dired pretty [functional]
       electric                    ; smarter, keyword-based electric-indent
       (ibuffer +icons)            ; interactive buffer management
       (undo +tree)                ; persistent, smarter undo for your inevitable mistakes
       vc                          ; version-control and Emacs, sitting in a tree

       :term
       ;;eshell                    ; the elisp shell that works everywhere
       ;;shell                     ; simple shell REPL for Emacs
       ;;term                      ; basic terminal emulator for Emacs
       vterm                       ; the best terminal emulation in Emacs

       :checkers
       ;; syntax                   ; tasing you for every semicolon you forget
       ;; spell                    ; tasing you for misspelling mispelling
       ;; grammar                  ; tasing grammar mistake every you make

       :tools
       ;; ansible                  ; a crucible for infrastructure as code
       ;;debugger                  ; FIXME stepping through code, to help you add bugs
       ;;direnv                    ; be direct about your environment
       docker                      ; port everything to containers
       ;;editorconfig              ; let someone else argue about tabs vs spaces
       ein                         ; tame Jupyter notebooks with emacs
       (eval +overlay)             ; run code, run (also, repls)
       gist                        ; interacting with github gists
       (lookup                     ; helps you navigate your code and documentation
        +dictionary                ; dictionary/thesaurus is nice
        +docsets)                  ; ...or in Dash docsets locally
       lsp                         ; Language Server Protocol
       (magit                      ; a git porcelain for Emacs
        +forge)                    ; interface with git forges
       make                        ; run make tasks from Emacs
       ;;pass                      ; password manager for nerds
       pdf                         ; pdf enhancements
       ;;prodigy                   ; FIXME managing external services & code builders
       rgb       ; creating color strings
       ;;taskrunner                ; taskrunner for all your projects
       ;;terraform                 ; infrastructure as code
       ;;tmux                      ; an API for interacting with tmux
       upload                      ; map local to remote projects via ssh/ftp

       :os
       (:if IS-MAC macos)          ; improve compatibility with macOS
       tty                         ; improve the terminal Emacs experience

       :lang
       ;;agda                      ; types of types of types of types...
       cc                          ; C/C++/Obj-C madness
       (clojure +lsp)              ; java with a lisp
       ;;common-lisp               ; if you've seen one lisp, you've seen them all
       ;;coq                       ; proofs-as-programs
       ;;crystal                   ; ruby at the speed of c
       ;;csharp                    ; unity, .NET, and mono shenanigans
       data                        ; config/data formats
       ;; (dart +flutter)          ; paint ui and not much else
       (elixir +lsp)               ; erlang done right
       ;;elm                       ; care for a cup of TEA?
       emacs-lisp                  ; drown in parentheses
       ;;erlang                    ; an elegant language for a more civilized age
       ;; ess                      ; emacs speaks statistics
       ;;faust                     ; dsp, but you get to keep your soul
       ;;fsharp                    ; ML stands for Microsoft's Language
       ;;fstar                     ; (dependent) types and (monadic) effects and Z3
       (go +lsp)                       ; the hipster dialect
       ;; (haskell +lsp)           ; a language that's lazier than I am
       ;;hy                        ; readability of scheme w/ speed of python
       ;;idris                     ;
       json                        ; At least it ain't XML
       ;;(java +meghanada)         ; the poster child for carpal tunnel syndrome
       (javascript +lsp)           ; all(hope(abandon(ye(who(enter(here))))))
       ;; (julia +lsp)             ; a better, faster MATLAB
       ;;kotlin                    ; a better, slicker Java(Script)
       ;; (latex                   ; writing papers in Emacs has never been so fun
       ;;  +latexmk                ; what else would you use?
       ;;  +cdlatex                ; quick maths symbols
       ;;  +fold)                  ; fold the clutter away nicities
       ;;lean                      ; proof that mathematicians need help
       ;;factor                    ; for when scripts are stacked against you
       ;;ledger                    ; an accounting system in Emacs
       ;; lua                      ; one-based indices? one-based indices
       markdown                    ; writing docs for people to ignore
       ;;nim                       ; python + lisp at the speed of c
       ;;nix                       ; I hereby declare "nix geht mehr!"
       ;;ocaml                     ; an objective camel
       (org                        ; organize your plain life in plain text
        +brain
        +dragndrop                 ; drag & drop files/images into org buffers
        +gnuplot
        +hugo                      ; use Emacs for hugo blogging
        +jupyter                   ; ipython/jupyter support for babel
        +noter
        +pandoc                    ; export-with-pandoc support
        +pomodoro                  ; be fruitful with the tomato technique
        +present                   ; using org-mode for presentations
        +pretty
        +roam)
       ;;perl                      ; write code no one else can comprehend
       ;;php                       ; perl's insecure younger brother
       ;;plantuml                  ; diagrams for confusing people more
       ;;purescript                ; javascript, but functional
       (python +lsp +pyright)      ; beautiful is better than ugly
       ;;qt                        ; the 'cutest' gui framework ever
       ;;racket                    ; a DSL for DSLs
       rest                        ; Emacs as a REST client
       ;;rst                       ; ReST in peace
       (ruby
        +lsp
        +rails
        +rvm)                      ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       (rust +lsp)                 ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       ;;scala                     ; java, but good
       ;;scheme                    ; a fully conniving family of lisps
       sh                          ; she sells {ba,z,fi}sh shells on the C xor
       ;;sml                       ; no, the /other/ ML
       ;;solidity                  ; do you need a blockchain? No.
       ;;swift                     ; who asked for emoji variables?
       ;;terra                     ; Earth and Moon in alignment for performance.
       web                         ; the tubes
       yaml                        ; JSON, but readable

       :email
       ;;(mu4e +gmail)
       ;;notmuch
       ;;(wanderlust +gmail)

       :app
       ;;calendar                  ; A dated approach to timetabling
       ;;emms                      ; Multimedia in Emacs is music to my ears
       everywhere                  ; *leave* Emacs!? You must be joking.
       ;; irc                      ; how neckbeards socialize
       (rss +org)                  ; emacs as an RSS reader
       ;;twitter                   ; twitter client https://twitter.com/vnought

       :config
       literate
       (default +bindings +smartparens)
       )
