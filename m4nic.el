;;----------------------------------------------------------------------------
;; Set load path
;;----------------------------------------------------------------------------
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (let* ((my-lisp-dir "~/.emacs.d/m4nic/site-lisp")
	   (default-directory my-lisp-dir))
      (progn
        (setq load-path (cons my-lisp-dir load-path))
        ;;(setq load-path my-lisp-dir)
	(normal-top-level-add-subdirs-to-load-path))))
(setq load-path (cons (expand-file-name "~/.emacs.d") load-path))

;; set our favourite color theme
(require 'color-theme)
(require 'color-theme-tango-2)
(color-theme-tango-2)


