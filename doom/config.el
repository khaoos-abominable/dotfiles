;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
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
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;; global settings

(setq-default default-input-method "russian-computer")
(setq-default which-key-idle-delay 0.4)
(setq avy-all-windows t)

;; always enable tabs but do not show them by default
(setq-default tab-bar-show nil)
(tab-bar-mode 1)
(advice-add 'doom-load-session :after #'(lambda (&rest r) (tab-bar-mode 1)))

;; maximize window on startup
(set-frame-parameter nil 'fullscreen 'maximized)

;; restart emacs and restore the current session
(map! :leader :desc "Restart and restore Emacs" "q R" #'khaoos/restart-and-restore)


;;; :editor evil
;; Focus new window after splitting
(setq evil-split-window-below t
      evil-vsplit-window-right t)

;; Implicit /g flag
(setq evil-ex-substitute-global t)

;; keybindings
;; expand region
(map! :leader :desc "Expand region" "v" #'er/expand-region)
;; windows
(map! :leader "w /" #'evil-window-vsplit)
(map! :leader "w C-w" #'evil-window-prev)
;; tabs
(map! :n "g t" #'evil-tab-next)
(map! :n "g T" #'tab-previous)
(map! :leader
      (:prefix-map ("w t". "tabs")
       ;; :desc "Display tabs" "TAB" #'toggle-frame-tab-bar
       :desc "Display tabs" "TAB" #'toggle-frame-tab-bar
       "n" #'evil-tab-next
       "p" #'tab-previous
       "'" #'tab-recent
       "t" #'tab-new
       "d" #'tab-close
       "D" #'tab-close-other
       "C-d" #'tab-close-group
       "u" #'tab-undo
       "l" #'tab-switch
       "L" #'tab-switcher
       "r" #'tab-rename
       "g" #'tab-group))
;; delete characters in the insert mode
(map! :i "C-h" #'evil-delete-backward-char-and-join)
;; unimpaired paste
(map! :n "[ p" #'khaoos/evil-paste-above)
(map! :n "] p" #'khaoos/evil-paste-below)
;; evil-snipe in visual mode. `s` already works. `S` is bound to evil-surround.
;; `z` is bound to narrowing.
(evil-define-key 'visual evil-snipe-local-mode-map "Z" 'evil-snipe-S)
(evil-define-key 'visual evil-snipe-local-mode-map "x" 'evil-snipe-x)
(evil-define-key 'visual evil-snipe-local-mode-map "X" 'evil-snipe-X)
;; copy-and-comment lines
(map! :nvm "g y" #'evilnc-copy-and-comment-operator)
;; repeat complex command
(map! :nv "C-," #'repeat)
;; avy go to any line
(map! :nm "g s l" #'evil-avy-goto-line)

;; evil-escape
(setq-default
    evil-escape-key-sequence "fj"
    evil-escape-unordered-key-sequence t)

;; new text object 'display area'
(define-key evil-inner-text-objects-map "v" 'khaoos/evil-display-area)
(define-key evil-outer-text-objects-map "v" 'khaoos/evil-display-area)


;;; :ui window-select
(custom-set-faces!
  '(aw-leading-char-face
    :foreground "white"
    :weight bold :height 2.0 :box (:line-width 1 :style released-button)))
(map! :map doom-leader-map "w D" #'ace-delete-window)
(map! :map doom-leader-map "w W" #'ace-window)



;;; session auto-restore
(defvar khaoos/session-restore-file
  (expand-file-name ".restore-on-next-start" user-emacs-directory))

;;;###autoload
(defun khaoos/restart-and-restore ()
  "Restart Emacs and restore the current session."
  (interactive)
  (doom/quicksave-session)
  (with-temp-file khaoos/session-restore-file (insert "restore"))
  (restart-emacs))

;;;###autoload
(defun khaoos/restore()
  (when (file-exists-p khaoos/session-restore-file)
    (delete-file khaoos/session-restore-file)
    (doom/quickload-session t)))

(add-hook! 'doom-after-init-hook :append #'khaoos/restore)

;;; unimpaired paste
(defun khaoos/evil-paste-above ()
  (interactive)
  (setq this-command 'evil-paste-after)
  (evil-insert-newline-above)
  (evil-paste-after 1))

(defun khaoos/evil-paste-below ()
  (interactive)
  (setq this-command 'evil-paste-after)
  (evil-insert-newline-below)
  (evil-paste-after 1))

;;; display area text object
(evil-define-text-object khaoos/evil-display-area (count &optional beg end type)
  (evil-range (window-start) (- (window-end) 1) type))


;;; Make evil commands respect the russian input method

;; `khaoos/evil-command-respect-im' is set to t when the command we want
;; to make respect the input method is triggered.
(defvar khaoos/evil-command-respect-im nil)
;; the list of commands we want to make respect the input method.
(setq khaoos/evil-commands-to-respect-im
      '(evil-find-char
        evil-find-char-to
        evil-find-char-backward
        evil-find-char-to-backward
        evil-replace
        evil-snipe-f
        evil-snipe-F
        evil-snipe-t
        evil-snipe-T
        evil-snipe-s
        evil-snipe-S
        evil-snipe-x
        evil-snipe-X
        evil-avy-goto-char-2
        evil-avy-goto-char-timer
        ))

(defun khaoos/call-interactively (orig-fun command &rest arg)
  "Make call-interactively respect the input method for evil commands that
   should respect the input method"
  (if (and evil-input-method
           (not current-input-method)
           (memq command khaoos/evil-commands-to-respect-im))
      (let ((khaoos/evil-command-respect-im t)
            result)
        (evil-without-input-method-hooks
          (activate-input-method evil-input-method)
          (unwind-protect
              (setq result (apply orig-fun (cons command arg)))
            (deactivate-input-method)))
        result)
    (apply orig-fun (cons command arg))))

(advice-add 'call-interactively :around #'khaoos/call-interactively)

(defun khaoos/evil-read-key (orig-fun &rest arg)
  "Replacement for `evil-read-key' for evil commands that should respect
   the input method"
  (if (and khaoos/evil-command-respect-im current-input-method)
      (read-char nil t)
    (apply orig-fun arg)))

(advice-add 'evil-read-key :around 'khaoos/evil-read-key)


;;; Make evil escape respect the russian input method

;; `khaoos/evil-escaping' is set to t only when evil-escaping is ongoing and
;; the input method is on
(defvar khaoos/evil-escaping nil)
;; keeps translations of evil escape key sequence for input methods so we
;; don't need to recalculate them all the time.
(defvar khaoos/evil-escape-keyseq-im-cache ())

(defun khaoos/evil-escape-this-command-keys (orig-fun &rest arg)
  "A variant of `this-command-keys' to make evil-escape respect the input method"
  (if (and khaoos/evil-escaping current-input-method)
      (key-description (this-command-keys-vector))
    (apply orig-fun arg)))

(advice-add 'this-command-keys :around #'khaoos/evil-escape-this-command-keys)

(defun khaoos/evil-escape-read-event-filter-args (args)
  "Filter for `read-event' args to make evil-escape respect the input method"
  (when (and khaoos/evil-escaping current-input-method)
    (cond ((>= (length args) 2) (setcar (cdr args) t))
          ((= (length args) 1) (setcdr args '(t)))))
  args)

(advice-add 'read-event :filter-args #'khaoos/evil-escape-read-event-filter-args)

(defun khaoos/evil-escape-key-sequence ()
  "Get `evil-escape-key-sequence' for the current input method"
  (if (and current-input-method
           (equal input-method-function `quail-input-method))
      (let* ((akey (cons evil-escape-key-sequence (quail-name)))
             (cached-result (assoc akey khaoos/evil-escape-keyseq-im-cache)))
        (if cached-result
            (cdr cached-result)
          (let ((keyseq-im ""))
            (dotimes (i (length evil-escape-key-sequence))
              (setq keyseq-im
                    (concat keyseq-im
                            (char-to-string
                             (car (quail-lookup-key
                                   (substring evil-escape-key-sequence i (1+ i))))))))
            (push (cons akey keyseq-im) khaoos/evil-escape-keyseq-im-cache)
            keyseq-im)))
    evil-escape-key-sequence))

(defun khaoos/evil-escape-pre-command-hook (orig-fun &rest arg)
  "A variant of `evil-ecsape-pre-command-hook' to make it respect the input method"
  (let* ((keyseq (khaoos/evil-escape-key-sequence))
         (evil-escape-key-sequence keyseq)
         (khaoos/evil-escaping t))
    (apply orig-fun arg)))

(advice-add 'evil-escape-pre-command-hook :around #'khaoos/evil-escape-pre-command-hook)
