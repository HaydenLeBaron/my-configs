;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

; FIXME: go through common mistakes and make sure I'm not making any:  https://github.com/hlissner/doom-emacs/blob/master/docs/getting_started.org#load-order

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Hayden LeBaron"
      user-mail-address "me@haydenlebaron.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-material-dark)
;;(setq doom-theme 'doom-tomorrow-night)
;;(setq doom-theme 'doom-1337)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE ;; TODO: figure out what I need to wrap in an `after!' block
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (no-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;

;=======================================================================
;; GLOBAL
;;=======================================================================

(setq mac-command-modifier      'hyper
      mac-option-modifir        'meta
      mac-right-option-modifier 'meta)



;;=======================================================================
;; LANGUAGE-SPECIFIC
;;=======================================================================

;; ----- OCAML ----------------------------------------------------------

;; ----- REASONML -------------------------------------------------------

(require 'utop)
;(setq utop-command "opam config exec -- rtop -emacs")
(add-hook 'reason-mode-hook #'utop-minor-mode) ;; can be included in the hook above as well

;;(map! :leader :desc "Go to org-roam" :n "r"  (lambda () (interactive) (find-file "~/org-roam"))) ;; Ex of running a command

;; Add the opam lisp dir to the emacs load path
(add-to-list
 'load-path
 (replace-regexp-in-string
  "\n" "/share/emacs/site-lisp"
  (shell-command-to-string "opam var prefix")))

;; Automatically load utop.el
(autoload 'utop "utop" "Toplevel for OCaml" t)

;;=======================================================================
;; ZETTELKASTEN
;;=======================================================================


;; ----- ORG MODE -------------------------------------------------------

; If you use `org' and don't want your org files in the default location below,
; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org-roam/")
(after! org
  (setq +org-capture-journal-file "~/org-roam/__JOURNAL.org")
  (setq +org-capture-notes-file "~/org-roam/__NOTES.org")
  (setq +org-capture-todo-file "~/org-roam/__TASKS.org")
  ;(setq org-agenda-files '(directory-files-recursively "~/org-roam/" "\\.org$"))
  ;(setq org-agenda-files (directory-files-recursively "~/org-roam/" "*"))
  ;(se
  ;(setq org-agenda-files '("~/org-roam/"))
  ;(setq org-agenda-files "~/org-roam") ; DOESN't WORK
  ;(setq org-agenda-files '("~/org-roam"))
  (setq org-agenda-skip-scheduled-if-done t
         org-agenda-skip-deadline-if-done t
         org-todo-keywords '((sequence "TODO" "WAITING" "MYINPROG" "|" "DONE" "CANCELED") (sequence "[ ]" "|" "[x]")) ; FIXME: make sequence work for md files
         org-todo-keywords-for-agenda '((sequence "TODO" "WAITING" "MYINPROG" "|" "DONE" "CANCELED")))
  )


;; TAG CONVENTIONS:
;;;; - Tags are used for:
;;;;   - filtering (in org-roam-ui)
;;;;   - metadata (esp. that you would like to filter by)
;;;; - Naming conventions:
;;;;   - @x prefix denotes that at least one @x tag should be on the file tags of this note.
;;;;   - lowercasefortokens
;;;;   - "_" for denoting mutually paths in the tag tree (think: going into a module/object)
;(setq org-tag-alist '((:startgroup . nil)
;                      ("I_example" . ?e)
;                      (:endgroup . nil)
;                      ("laptop" . ?l) ("pc" . ?p)))
(setq org-tag-alist '(
                      ;--------------
                      ; d_* prefix denotes a Deprecated tag
                      ;-------------
                      ; s_* prefix denotes a Stage of writing tag
                      (:startgroup)
                      ("@s_stubbed")        ; dummy note, perhaps with a few plans sketched in
                      ("@s_outlined")       ; scaffolded, not fleshed out content
                      ("@s_brainstormed")   ; lo-quality, probably non-atomic
                      ("@s_drafted")        ; quality, non-atomic
                      ("@s_atom")           ; quality, atomic, unlinked
                      ("@s_evergreen")      ; quality, atomic, linked -- finished zettel
                      ("@s_null")           ; NULL
                      (:endgroup)
                      ;--------------
                      ; i_* prefix denotes an Interface tag
                      ;   (which a note must satisfy)
                      ("@i_topic")     ; For marking notes on broad topics.
                                         ;; Such notes are often sparse
                                         ;; and serve linking purposes
                      ("@i_moc")   ; marks map of content
                      ("@i_doc")   ; Documentation about the system
                      ("@i_quote")
                      ("@i_note")  ; Regular note
                      ("@i_null")  ; NULL
                      ;--------------
                      ; k_* prefix denoting a Kind tag
                      ;;; (what kind of thing is the subject of the note)
                      ("k_person")
                      ("k_company")
                      ("k_book")
                      ("k_article")
                      ("k_paper")    ; (usually academic)
                      ("k_course")   ; (usually a course I took)
                      ("k_null")     ; (unspecified)
                      ;--------------
                      ; es_* denotes an Epistemic status tag
                      ;; i.e: confidence in the ideas put forth in a note
                      (:startgroup)
                      ("@es_hi")
                      ("@es_med")
                      ("@es_lo")
                      ("@es_pre")  ; pre-confidence => Don't yet even believe
                                   ;; in the ideas put forth
                      ("@es_anti") ; anti-confidence => some level of confidence
                                   ;; that the ideas are wrong
                      ("@es_na")   ; N/A
                      ("@es_null") ; NULL
                      (:endgroup)
                      ;--------------
                      ; ee_* denotes an Epistemic effort tag
                      ;; i.e: What steps did you take to make sure the
                      ;; content of the note was accurate?
                      (:startgroup)
                      ("@ee_hi")
                      ("@ee_med")
                      ("@ee_lo")
                      ("@ee_pre") ; pre-effort => totally untested hypothesis/speculation
                      ("@ee_na")  ; N/A
                      ("@ee_null")
                      (:endgroup)
                      ;--------------
                      ; m_* denotes a Maintenance commitment tag
                      ("@m_static") ; denotes that I'm
                                    ;; NOT ALLOWED to change note contents
                      ("@m_append") ; denotes that I'm only allowed
                                    ;; to append additional content to the note
                      (:startgroup)
                      ("@m_5y")
                      ("@m_3y")
                      ("@m_1y")
                      ("@m_6m")
                      ("@m_1m")
                      ("@m_1w")
                      ("@m_null")
                      (:endgroup)
                      ;--------------
                      ; log_* prefix denotes a Logging tag
                      ("log_md") ; mark markdown notes
                ))

;; ----- ORG LATEX ------------------------------------------------------

(after! org (setq org-startup-with-latex-preview t))

;; Enable nice embedded LaTeX stuff
(use-package! org-fragtog
  :after org
  :hook (org-mode . org-fragtog-mode)
  :config ; whatever you want here
  )

;; ----- ORG ROAM -------------------------------------------------------

;(use-package! org-roam-timestamps
;  :after org-roam
;  :config (org-roam-timestamps-mode))
;
;(setq org-roam-capture-templates
;      '(("d" "default" plain "%?"
;              :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
;":PROPERTIES:
;:ID: %(org-id-new)
;:ROAM_ALIASES:
;:END:
;#+title: ${title}
;#+filetags: :@m_null:@es_null:@ee_null:@i_null:@s_null:@:k_null"
;)
;              :unnarrowed t)))
;
;(setq org-roam-directory (file-truename "~/org-roam"))
;
;(setq org-roam-mode-sections
;      (list #'org-roam-backlinks-section
;            #'org-roam-reflinks-section
;            #'org-roam-unlinked-references-section ; This can be slow. Comment out if need performance
;            ))
;
;;; Org-roam pop-up buffer display
;(add-to-list 'display-buffer-alist
;             '("\\*org-roam\\*"
;               (display-buffer-in-direction)
;               (direction . right)
;               (window-width . 0.33)
;               (window-height . fit-window-to-buffer)))
;
;
;;;(map! :leader :desc "Go to org-roam" :n "r"  (lambda () (interactive) (find-file "~/org-roam"))) ;; Ex of running a command
;
;(map! :leader
;      :desc "Find org-roam file" :n "F"
;      (lambda () (interactive)
;        (org-roam-node-find
;         ;:which-key "starting-text" ; uncomment to "type in" starting-text to search bar
;       )))
;
;(map! :leader
;      :desc "Today's org-roam daily" :n "T"
;      (lambda () (interactive)
;        (org-roam-dailies-goto-today)))
;
;(add-hook 'org-mode-hook
;          'org-roam-timestamps-mode
;          'org-roam-db-autosync-mode)
;
;(map! :map org-mode-map
;      :localleader
;      "SPC" '(:ignore t                     :which-key "org-roam")
;      "SPC i" '(org-roam-node-insert        :which-key "org-roam-node-insert")
;      "SPC s" '(org-roam-db-sync            :which-key "org-roam-db-sync")
;      "SPC g" '(org-roam-graph              :which-key "org-roam-node-graph")
;      "SPC u" '(org-roam-ui-open            :which-key "org-roam-ui-open")
;      "SPC t" '(org-roam-tag-add            :which-key "org-roam-tag-add")
;      "SPC T" '(org-roam-dailies-goto-today :which-key "org-roam-dailies-goto-today")
;      "SPC x" '(org-roam-capture            :which-key "org-roam-capture")
;      "SPC y" '(org-roam-dailies-goto-yesterday :which-key "org-roam-dailies-goto-yesterday")
;      )
;
;;; org-roam-ui config for doom -- see https://github.com/org-roam/org-roam-ui
;(use-package! websocket
;  :after org-roam)
;(use-package! org-roam-ui
;  :after org-roam ;; or :after org
;  ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;  ;;         a hookable mode anymore, you're advised to pick something yourself
;  ;;         if you don't care about startup time, use
;  ;;  :hook (after-init . org-roam-ui-mode)
;  :config
;  (setq org-roam-ui-sync-theme t
;        org-roam-ui-follow t
;        org-roam-ui-update-on-save t
;        org-roam-ui-open-on-start t))
;
;
;; ----- MD ROAM -------------------------------------------------------
;;;; Make org-roam work interchangeably with .md files.
;;;; https://github.com/nobiot/md-roam Works with org-roam-ui.
;;;; NOTE: put these configurations AFTER org-roam configs
;;;;
;(add-to-list  'load-path "~/.doom.d/md-roam") ; path/to/md-roam
;(require 'org-roam) ;; TODO: do I need this line?

;; file-truename is optional; it seems required when you use symbolic
;; links, which Org-roam does not resolve
;(setq org-roam-file-extensions '("org" "md")) ; enable Org-roam for a markdown extension
;(add-to-list 'load-path "~/.doom.d/md-roam") ; path/to/md-roam; installation as above
;(require 'md-roam)
;(md-roam-mode 1) ; md-roam-mode must be active before org-roam-db-sync
;(setq md-roam-file-extension "md") ; default "md". Specify an extension such as "markdown"
;(org-roam-db-autosync-mode 1) ; autosync-mode triggers db-sync. md-roam-mode must be already active
;
;; TODO: update
;(add-to-list 'org-roam-capture-templates
;             '("m" "Markdown" plain ""
;               :target (file+head "%<%Y%m%d%H%M%S>-${slug}.md"
;"---\ntitle: ${title}\nid: %<%Y%m%dT%H%M%S>\nfiletags: #log_md \n---\n")
;    :unnarrowed t))


;; ----- ORG ANKI -------------------------------------------------------

(customize-set-variable 'org-anki-default-deck "org-roam-deck")

;; org-anki commands
(map! :map org-mode-map
      :localleader
      "m"    '(:ignore t             :which-key "org-anki (\"MeMorize\")")
      "m s" '(org-anki-sync-entry   :which-key "org-anki-sync-entry")
      "m S" '(org-anki-sync-all     :which-key "org-anki-sync-all")
      "m c" '(org-anki-cloze-dwim   :which-key "org-anki-cloze-dwim")
      "m u" '(org-anki-update-all   :which-key "org-anki-update-all")
      "m b" '(org-anki-browse-entry :which-key "org-anki-browse-entry")
      "m D" '(org-anki-delete-entry :which-key "org-anki-delete-entry") ; uncomment for easier delete
      )

;; I encountered the following message when attempting
;; to run org-anki-sync-entry
;; "Unable to resolve link: FILE-ID"
; Run this to fix
;(defun hsl/force-org-rebuild-cache ()
  ;"Rebuild the `org-mode' and `org-roam' cache."
  ;(interactive)
  ;(org-id-update-id-locations)
  ;;; Note: you may need `org-roam-db-clear-all'
  ;;; followed by `org-roam-db-sync'
  ;(org-roam-db-sync)
  ;(org-roam-update-org-id-locations))



;; ----- ORG CITE -------------------------------------------------------
;;;; Built-in citations in org-mode
;;;;
;;;;Some variables you need to change/define for your own case. Note org-cite-csl-styles-dir
;;;;(I use Zotero and set mine to Zotero's styles directory). I also think org-cite-global-bibliography
;;;;should be a list of absolute file paths. I don't think you need to change the definition of
;;;;org-cite-csl-locales-dir. I have also added to org-cite-export-processors which will make
;;;;org-cite not work unless those files exist in your CSL directory.
;;;;
;;;; config and notes source: https://www.reddit.com/r/orgmode/comments/qbk6y8/citations_state_of_things/

(use-package oc
  ;:straight nil
  :after (bibtex-completion bibtex-actions)
  :general
  (:keymaps 'org-mode-map
            [remap bibtex-actions-insert-citation] '(org-cite-insert :which-key "Insert citation"))
  :custom
  (setq org-cite-global-bibliography "~/org-roam/org_roam.bib")
  ;(org-cite-global-bibliography bibtex-completion-bibliography)
  ;(org-cite-csl-locales-dir (expand-file-name (concat user-emacs-directory "locales/")))
  ;(org-cite-csl-styles-dir (expand-file-name "~/Documents/Zotero/styles"))
  (org-cite-export-processors
   '((md csl "chicago-fullnote-bibliography.csl")   ; Footnote reliant
     (latex csl "chicago-author-date.csl")          ; For philosophy
     (odt csl "chicago-fullnote-bibliography.csl")  ; Footnote reliant
     (docx csl "chicago-fullnote-bibliography.csl") ; Footnote reliant
     (t csl "modern-language-association.csl")
     ))
  :config
  ;; NOTE 2021-10-11: Need org-export to be loaded for org files to properly be
  ;; loaded without calling `org-export-dispatch'.
  (require 'ox)
  ;; NOTE 2021-10-11: For some reason these aren't being loaded?
  (require 'oc-csl)
  (require 'oc-basic)
  (require 'oc-bibtex)
  (require 'oc-biblatex)

  ;; Have citation links be as they were for `org-ref'
  (set-face-attribute 'org-cite nil :foreground "DarkSeaGreen4")
  (set-face-attribute 'org-cite-key nil :foreground "forest green")
  )


;; ----- LAST  -----------------------------------------------------------
;;;; Put these things here because things seem to not work otherwise

; FIXME: For some reason, these are being overwritten on load. But then when I run them *after* starting emacs, everything works.
(setq org-agenda-file-regexp "(\\.org$|\\.md$)") ; FIXME: make .md files work for org-roam and org-agenda-todo
(setq org-agenda-files (directory-files-recursively "~/org-roam/" "\\.org$"))
