;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


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
;;   (after! PACKAGE
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
(setq org-roam-directory (file-truename "~/org-roam"))



;;=======================================================================
;; LANGUAGE-SPECIFIC
;;=======================================================================


;; ----- REASONML -------------------------------------------------------

(require 'utop)
(add-hook 'reason-mode-hook #'utop-minor-mode) ;; can be included in the hook above as well


;;=======================================================================
;; ZETTELKASTEN
;;=======================================================================


;; ----- ORG MODE ------------------------------------------------------

; If you use `org' and don't want your org files in the default location below,
; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org-roam/")
(setq +org-capture-journal-file "~/org-roam/__JOURNAL.org")
(setq +org-capture-notes-file "~/org-roam/__NOTES.org")
(setq +org-capture-todo-file "~/org-roam/__TASKS.org")

;; ----- ORG LATEX ------------------------------------------------------

(after! org (setq org-startup-with-latex-preview t))

;; Enable nice embedded LaTeX stuff
(use-package! org-fragtog
  :after org
  :hook (org-mode . org-fragtog-mode)
  :config ; whatever you want here
  )

;; ----- ORG ROAM -------------------------------------------------------

(setq org-roam-mode-sections
      (list #'org-roam-backlinks-section
            #'org-roam-reflinks-section
            #'org-roam-unlinked-references-section ; This can be slow. Comment out if need performance
            ))

;; Org-roam pop-up buffer display
(add-to-list 'display-buffer-alist
             '("\\*org-roam\\*"
               (display-buffer-in-direction)
               (direction . right)
               (window-width . 0.33)
               (window-height . fit-window-to-buffer)))


;;(map! :leader :desc "Go to org-roam" :n "r"  (lambda () (interactive) (find-file "~/org-roam"))) ;; Ex of running a command

(map! :leader
      :desc "Go to org-roam" :n "F"
      (lambda () (interactive)
        (org-roam-node-find
         ;:which-key "starting-text" ; uncomment to "type in" starting-text to search bar
       )))

(add-hook 'org-mode-hook 'org-roam-db-autosync-mode)
(map! :map org-mode-map
      :localleader
      "SPC" '(:ignore t                     :which-key "org-roam")
      "SPC i" '(org-roam-node-insert        :which-key "org-roam-node-insert")
      "SPC s" '(org-roam-db-sync            :which-key "org-roam-db-sync")
      "SPC g" '(org-roam-graph              :which-key "org-roam-node-graph")
      "SPC u" '(org-roam-ui-open            :which-key "org-roam-ui-open")
      "SPC t" '(org-roam-dailies-goto-today :which-key "org-roam-dailies-goto-today")
      "SPC x" '(org-roam-capture            :which-key "org-roam-capture")
      )

;; org-roam-ui config for doom -- see https://github.com/org-roam/org-roam-ui
(use-package! websocket
  :after org-roam)
(use-package! org-roam-ui
  :after org-roam ;; or :after org
  ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
  ;;         a hookable mode anymore, you're advised to pick something yourself
  ;;         if you don't care about startup time, use
  ;;  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))


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
      "m D" '(org-anki-delete-entry :which-key "org-anki-delete-entry")
      )
