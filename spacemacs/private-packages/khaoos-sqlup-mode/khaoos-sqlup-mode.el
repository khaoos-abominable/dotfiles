;;; upcase sql keywords automatically while typing
;;; originally picked from https://github.com/trevoke/sqlup-mode.el
;;; orignial package was heavily simplified for my own needs

(require 'cl-lib)
(require 'sql)


;;; Internal variables
(defconst sqlup-trigger-characters
  (mapcar 'string-to-char '(";"
                            " "
                            "("
                            ","
                            "'"))
  "When the user types one of these characters,
this mode's logic will be evaluated.")

(defvar khaoos-sqlup-keywords-regexps
  '("select" "from" "where" "insert" "into" "update" "set" "delete" "merge" "matched" "distinct"
    "join" "left" "right" "full" "on" "union" "all" "exists" "minus" "intersect"
    "or" "and" "not" "in" "is" "null"
    "sum" "max" "min" "avg"
    "case" "when" "then" "else" "if" "loop" "for" "while"
    "begin" "end"
    "date"
    "row_number"
    "over" "partition" "by"
    "procedure" "function" "package"
    "create" "drop"
    "table" "index" "sequence" "comment" "tablespace"
    "move" "rebuild"
    ))

;;;###autoload
(define-minor-mode khaoos-sqlup-mode
  "Capitalizes SQL keywords for you."
  :lighter " SUP"
  (if khaoos-sqlup-mode
      (sqlup-enable-keyword-capitalization)
    (sqlup-disable-keyword-capitalization)))

(defun sqlup-enable-keyword-capitalization ()
  "Add buffer-local hook to handle this mode's logic"
  (add-hook 'post-command-hook 'sqlup-capitalize-as-you-type nil t))

(defun sqlup-disable-keyword-capitalization ()
  "Remove buffer-local hook to handle this mode's logic"
  (remove-hook 'post-command-hook 'sqlup-capitalize-as-you-type t))

(defun sqlup-capitalize-as-you-type ()
  "If the user typed a trigger key, check if we should capitalize
the previous word."
  (if (sqlup-should-do-work-p)
      (save-excursion (sqlup-maybe-capitalize-symbol -1))))

(defun sqlup-should-do-work-p ()
  "Checks whether the user pressed one of the trigger keys.
Other than <RET>, characters are in variable sqlup-trigger-characters."
  (and (sqlup-not-just-initialized-p)
       (or (sqlup-user-pressed-return-p)
           (and (sqlup-user-is-typing-p)
                (sqlup-trigger-self-insert-character-p)))))

(defun sqlup-not-just-initialized-p ()
  (not (eq this-command 'khaoos-sqlup-mode)))

(defun sqlup-user-pressed-return-p ()
  (and (< 0 (length (this-command-keys-vector)))
       (or (equal 13 last-command-event)
           (equal 10 last-command-event))))

(defun sqlup-user-is-typing-p ()
  (eq this-command #'self-insert-command))

(defun sqlup-trigger-self-insert-character-p ()
  (let ((sqlup-current-char last-command-event))
    (member sqlup-current-char sqlup-trigger-characters)))

(defun sqlup-maybe-capitalize-symbol (direction)
  "DIRECTION is either 1 for forward or -1 for backward"
  (with-syntax-table (make-syntax-table sql-mode-syntax-table)
    ;; Give \ symbol syntax so that it is included when we get a symbol. This is
    ;; needed so that \c in postgres is not treated as the keyword C.
    (modify-syntax-entry ?\\ "_")
    (forward-symbol direction)
    (sqlup-work-on-symbol (thing-at-point 'symbol)
                          (bounds-of-thing-at-point 'symbol))))

(defun sqlup-work-on-symbol (symbol symbol-boundaries)
  (if (and symbol
           (sqlup-keyword-p (downcase symbol))
           (sqlup-capitalizable-p (point)))
      (upcase-region (car symbol-boundaries)
                     (cdr symbol-boundaries))))

(defun sqlup-keyword-p (word)
  (cl-some (lambda (reg) (string-match-p (concat "^" reg "$") word))
           khaoos-sqlup-keywords-regexps))

(defun sqlup-capitalizable-p (point-location)
  (with-current-buffer (current-buffer)
    (goto-char point-location)
    (and (not (sqlup-comment-p))
          (not (sqlup-string-p)))))

(defun sqlup-comment-p ()
  (and (nth 4 (syntax-ppss)) t))

(defun sqlup-string-p ()
  (and (nth 3 (syntax-ppss)) t))

;;;###autoload
(defun khaoos-sqlup-capitalize-keywords-in-region (start-pos end-pos)
  "Call this function on a region to capitalize the SQL keywords therein."
  (interactive "r")
  (save-excursion
    (goto-char start-pos)
    (while (< (point) end-pos)
      (sqlup-maybe-capitalize-symbol 1))))

(defadvice font-lock-mode (around sqlup-ignore-font-lock-on-indirect-buffer activate)
  "Do not turn on jit-lock-mode on indirect buffers at all.
Because we're using indirect buffers, the font face gets shared and when we
change the major mode in the indirect buffer it messes with the font in the
base buffer (the one the user cares about). This tells emacs to not enable
font locking in an indirect buffer for which the primary buffer has
sqlup-mode enabled."
  (unless (and (buffer-base-buffer)
               (with-current-buffer (buffer-base-buffer)
                 khaoos-sqlup-mode))
    ad-do-it))

(provide 'khaoos-sqlup-mode)
