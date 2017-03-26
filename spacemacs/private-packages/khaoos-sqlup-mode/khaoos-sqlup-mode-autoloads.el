(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

(autoload 'khaoos-sqlup-mode "khaoos-sqlup-mode" "\
Capitalizes SQL keywords for you.

\(fn &optional ARG)" t nil)

(autoload 'khaoossqlup-capitalize-keywords-in-region "khaoos-sqlup-mode" "\
Call this function on a region to capitalize the SQL keywords therein.

\(fn START-POS END-POS)" t nil)


;;;### (autoloads nil "khaoos-sqlup-mode" "khaoos-sqlup-mode.el"
;;;;;;  (22743 45263 920257 769000))
;;; Generated autoloads from khaoos-sqlup-mode.el

(autoload 'khaoos-sqlup-mode "khaoos-sqlup-mode" "\
Capitalizes SQL keywords for you.

\(fn &optional ARG)" t nil)

(autoload 'khaoos-sqlup-capitalize-keywords-in-region "khaoos-sqlup-mode" "\
Call this function on a region to capitalize the SQL keywords therein.

\(fn START-POS END-POS)" t nil)

;;;***
