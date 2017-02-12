;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     windows-scripts
     sql
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     ;; better-defaults
     emacs-lisp
     ;; git
     ;; markdown
     org
     ;; (shell :variabls
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     (spell-checking :variables spell-checking-enable-by-default nil)
     ;; syntax-checking
     ;; version-control
     ;; evil-commentary
     ;; evil-russian
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq-default
    ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
    ;; derivatives. If set to `relative', also turns on relative line numbers.
    ;; (default nil)
    dotspacemacs-line-numbers t
    ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
    ;; several times cycle between the kill ring content. (default nil)
    dotspacemacs-enable-paste-transient-state t
  )
  ;; enable spell-checking via aspell
  (add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
  (setq-default ispell-program-name "aspell")
)

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; set alternative input method as russian
  (setq-default default-input-method "russian-computer")

  ;; set preferrable coding systems: next one is preferrable then previous one
  (prefer-coding-system 'windows-1251)
  (prefer-coding-system 'utf-8)

  ;; disable electric indent mode
  (electric-indent-mode -1)

  ;; settings for sql-mode
  ;; make underscore symbol act like a space character in sql-mode
  (add-hook 'sql-mode-hook (lambda () (modify-syntax-entry ?_ "w")))
  ;; key-binding for sending the whole line in the sql buffer
  (spacemacs/set-leader-keys-for-major-mode 'sql-mode "sl" 'sql-send-line-and-next)
  ;; key-binding for start new connection
  (spacemacs/set-leader-keys-for-major-mode 'sql-mode "cn" 'khaoos-sql-oracle-start)
  (spacemacs/set-leader-keys-for-major-mode 'sql-mode "cc" 'sql-connect)

  ;; settings for auto-completion
  (setq-default
    ;; keyboard combination to select item from auto-completion list contactedm
    auto-completion-complete-with-key-sequence "jk"
  )

  ;; settings for evil-escape
  (setq-default
    evil-escape-unordered-key-sequence t
    khaoos-evil-escape-ignore-input-method t)

  ;; set fill column for some modes
  (add-hook 'sql-mode-hook (lambda() (khaoos-toggle-fill-column 120)))
  (add-hook 'text-mode-hook (lambda() (khaoos-toggle-fill-column 140)))

  ;; Keyboard combination to add missing functionality to repeat f,F,t,T commands in opposite way
  (define-key evil-normal-state-map (kbd "C-;") 'evil-repeat-find-char-reverse)
  ;; Keyboard combinations to insert blank lines and move to them in normal mode
  (define-key evil-normal-state-map (kbd "RET")
    (lambda ()
      (interactive)
      (call-interactively 'spacemacs/evil-insert-line-below)
      (evil-next-line)))
  (define-key evil-normal-state-map (kbd "<C-return>")
    (lambda ()
      (interactive)
      (call-interactively 'spacemacs/evil-insert-line-above)
      (evil-previous-line)))

  ;; Keyboard combinations to delete charcters and words in insert mode
  (define-key evil-insert-state-map (kbd "C-,") 'backward-delete-char-untabify)
  (define-key evil-insert-state-map (kbd "C-.") 'delete-char)
привет андрней о лвыоавывл ввллдд д дывдав а в
  ;; Rebind normal commands that don't respect input method
  (define-key evil-normal-state-map (kbd "r") (lambda () (interactive) (khaoos-run-evil-command-respect-input-method 'evil-replace)))
  (define-key evil-motion-state-map (kbd "f") (lambda () (interactive) (khaoos-run-evil-command-respect-input-method 'evil-find-char)))
  (define-key evil-motion-state-map (kbd "t") (lambda () (interactive) (khaoos-run-evil-command-respect-input-method 'evil-find-char-to)))
  (define-key evil-motion-state-map (kbd "F") (lambda () (interactive) (khaoos-run-evil-command-respect-input-method 'evil-find-char-backward)))
  (define-key evil-motion-state-map (kbd "T") (lambda () (interactive) (khaoos-run-evil-command-respect-input-method 'evil-find-char-to-backward)))
)

(defun khaoos-toggle-fill-column (colnum)
  (set-fill-column colnum)
  (spacemacs/toggle-fill-column-indicator-on))

(defun khaoos-sql-oracle-start ()
  (interactive)
  (sql-set-product 'oracle)
  (sql-product-interactive 'oracle))

(defvar khaoos-input-method-last-raw-key nil
  "The last key pressed with an input method switched on but ignoring conversion
of the input method.")

(defun khaoos-capture-input-mode-raw-key (key)
  "Function captures an input key ignoring the current input method.
Doesn't work for complex input methods which use event loops."
  (setq khaoos-input-method-last-raw-key (char-to-string key)))

(defun khaoos-activate-input-method (input-method)
  "Defines an advise for a function which implements current input method."
  ;; We don't bother ourselves to remove the advise when we deactivate the input method.
  ;; The chances are high that we'll reuse it.
  ;; We may end up with several advices for different input methods if an user uses them.
  ;; It doesn't matter as the only one work at the moment.
  (if input-method-function
      (advice-add input-method-function :before #'khaoos-capture-input-mode-raw-key)))

(advice-add 'activate-input-method :after #'khaoos-activate-input-method)

(defcustom khaoos-evil-escape-ignore-input-method nil
  "If non-nil then the key sequence can be entered ignoring the current input method if any."
  :type 'boolean
  :group 'evil-escape)

(defun khaoos-evil-escape-p ()
  "Return non-nil if evil-escape can run.
Edited by khaoos to implement the ability of ignoring the input method"
  (and evil-escape-key-sequence
       (not evil-escape-inhibit)
       (or (window-minibuffer-p)
           (bound-and-true-p isearch-mode)
           (memq major-mode '(ibuffer-mode
                              image-mode))
           (evil-escape--is-magit-buffer)
           (and (fboundp 'helm-alive-p) (helm-alive-p))
           (or (not (eq 'normal evil-state))
               (not (eq 'evil-force-normal-state
                        (lookup-key evil-normal-state-map [escape])))))
       (not (memq major-mode evil-escape-excluded-major-modes))
       (not (memq evil-state evil-escape-excluded-states))
       (or (not evil-escape-enable-only-for-major-modes)
           (memq major-mode evil-escape-enable-only-for-major-modes))
       (or (equal (this-command-keys) (evil-escape--first-key))
           (and khaoos-evil-escape-ignore-input-method ;;khaoos+
                current-input-method ;;khaoos+
                (equal khaoos-input-method-last-raw-key (evil-escape--first-key))) ;;khaoos+
           (and evil-escape-unordered-key-sequence
                (or (equal (this-command-keys) (evil-escape--second-key))))
           (and evil-escape-unordered-key-sequence ;;khaoos+
                khaoos-evil-escape-ignore-input-method ;;khaoos+
                current-input-method ;;khaoos+
                (equal khaoos-input-method-last-raw-key (evil-escape--second-key)))) ;;khaoos+
       (not (cl-reduce (lambda (x y) (or x y))
                       (mapcar 'funcall evil-escape-inhibit-functions)
                       :initial-value nil))))

(defun khaoos-evil-escape-pre-command-hook ()
  "evil-escape pre-command hook.
Edited by khaoos to implement the ability of ignoring the input method"
  (with-demoted-errors "evil-escape: Error %S"
      (when (khaoos-evil-escape-p)
        (let* ((modified (buffer-modified-p))
               (inserted (evil-escape--insert))
               (fkey (elt evil-escape-key-sequence 0))
               (skey (elt evil-escape-key-sequence 1))
               (evt (read-event nil nil evil-escape-delay)))
          (when inserted (evil-escape--delete))
          (set-buffer-modified-p modified)
          (cond
           ((and (characterp evt)
                 (or (and (or (equal (this-command-keys) (evil-escape--first-key)) ;;khaoos*
                              (and khaoos-evil-escape-ignore-input-method ;;khaoos+
                                   current-input-method ;;khaoos+
                                   (equal khaoos-input-method-last-raw-key (evil-escape--first-key)))) ;;khaoos+
                          (char-equal evt skey))
                     (and evil-escape-unordered-key-sequence
                          (or (equal (this-command-keys) (evil-escape--second-key)) ;;khaoos*
                              (and khaoos-evil-escape-ignore-input-method ;;khaoos+
                                   current-input-method ;;khaoos+
                                   (equal khaoos-input-method-last-raw-key (evil-escape--second-key)))) ;;khaoos+
                          (char-equal evt fkey))))
            (evil-repeat-stop)
            (when (evil-escape-func) (setq this-command (evil-escape-func))))
           ((null evt))
           (t (setq unread-command-events
                    (append unread-command-events (list evt)))))))))

(advice-add 'evil-escape-pre-command-hook :override #'khaoos-evil-escape-pre-command-hook)

(defun khaoos-evil-read-key-respect-input-method (evil-read-key-result)
  "Gets the result of evil-read-key function and converts it according the current input method
which at the moment could be a method of a family of quail input methods"
  (if (and (characterp evil-read-key-result)
           current-input-method
           (equal input-method-function 'quail-input-method))
    (let* ((translated-key-list (quail-lookup-key (char-to-string evil-read-key-result)))
           (translated-key (if (equal (length translated-key-list) 1)
                               (car translated-key-list)
                               evil-read-key-result)))
          translated-key)
    evil-read-key-result))

(advice-add 'evil-read-key :filter-return 'khaoos-evil-read-key-respect-input-method)

(defun khaoos-run-evil-command-respect-input-method (evil-command)
  "Runs interactively evil command evil-command which respects now the current input method"
  ;; if we are in the mode which prohibits input method we do a trick
  (if (and evil-input-method (not current-input-method))
    (evil-without-input-method-hooks
      (activate-input-method evil-input-method)
      (call-interactively evil-command)
      (inactivate-input-method))
    (call-interactively evil-command)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (key-chord evil-commentary ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org sql-indent spacemacs-theme spaceline restart-emacs request rainbow-delimiters quelpa powershell popwin persp-mode pcre2el paradox org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot flyspell-correct-helm flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word company-statistics column-enforce-mode clean-aindent-mode auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(sql-connection-alist
   (quote
    (("dwh@dome_test"
      (sql-product
       (quote oracle))
      (sql-user "dwh")
      (sql-database "dome.tst"))
     ("techdba@dmloader_test"
      (sql-product
       (quote oracle))
      (sql-user "techdba")
      (sql-database "dmloadertst"))
     ("dwh@cft_test"
      (sql-product
       (quote oracle))
      (sql-user "dwh")
      (sql-database "cftutcpl"))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
