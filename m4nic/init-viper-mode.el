;; C-z is usually 'iconify-or-deiconify-frame, but viper uses it to toggle
;; vi/emacs input modes, causing confusion in non-viper buffers
(global-unset-key "\C-z")
(setq viper-mode t)
(setq viper-custom-file-name (convert-standard-filename "~/.emacs.d/.viper"))
(require 'viper)
(require 'vimpulse)
(define-key viper-insert-global-user-map (kbd "C-n") 'dabbrev-expand)
(define-key viper-insert-global-user-map (kbd "C-p") 'dabbrev-expand)

;; rate at which macros should be typed
(setq viper-fast-keyseq-timeout 200)

;; Stop C-u from clobbering prefix-arg -- I always use C-b/C-f to scroll
(define-key viper-vi-basic-map "\C-u" nil)

;; Vim-style searching of the symbol at point, made easy by highlight-symbol
(autoload 'highlight-symbol-next "highlight-symbol" "Highlight symbol at point")
(autoload 'highlight-symbol-prev "highlight-symbol" "Highlight symbol at point")
(setq highlight-symbol-on-navigation-p t)
(define-key viper-vi-global-user-map "*" 'highlight-symbol-next)
(define-key viper-vi-global-user-map "#" 'highlight-symbol-prev)
(define-key viper-vi-global-user-map "=" 'indent-region)
(define-key viper-vi-global-user-map "g;" 'session-jump-to-last-change)
(define-key viper-vi-global-user-map ";b" 'ibuffer)
(define-key viper-vi-global-user-map "Q" 'kmacro-start-macro)
(define-key viper-vi-global-user-map "q" 'kmacro-end-macro)
(define-key viper-vi-global-user-map ";s" 'apply-macro-to-region-lines)
(define-key viper-vi-global-user-map ";;" 'switch-to-buffer)
(define-key viper-vi-global-user-map ";'" 'delete-window)
(define-key viper-vi-global-user-map ";\\" 'delete-other-windows)
(define-key viper-vi-global-user-map ";o" 'other-window)
(define-key viper-vi-global-user-map ";d" 'dired)
(define-key viper-vi-global-user-map ";f" 'ido-find-file)
(define-key viper-vi-global-user-map ";x" 'smex)
(define-key viper-vi-global-user-map ";X" 'smex-update-and-run)
(define-key viper-vi-global-user-map ";a" 'anything)
(define-key viper-vi-global-user-map ";k" 'kill-buffer)
(define-key viper-vi-global-user-map "zo" 'show-entry)
(define-key viper-vi-global-user-map "zc" 'hide-entry)
(define-key viper-vi-global-user-map "zr" 'show-all)
(define-key viper-vi-global-user-map "zm" 'hide-body)
;; other keys are defined in .viper

;; make modes more prominent
(setq viper-vi-state-id (concat (propertize "<V>" 'face 'hi-blue-b) " "))
(setq viper-emacs-state-id (concat (propertize "<E>" 'face 'hi-red-b) " "))
(setq viper-insert-state-id (concat (propertize "<I>" 'face 'hi-blue-b) " "))
(setq viper-replace-state-id (concat (propertize "<R>" 'face 'hi-blue-b) " "))

;; use jumplist just like vim
;(require 'init-ejumplist)
(global-set-key "\C-o"
              '(lambda ()
                 (interactive)
                 (set-mark-command 0)))

;; the property `risky-local-variable' is a security measure for mode line
;; variables that have properties.
(put 'viper-mode-string 'risky-local-variable t)

(provide 'init-viper-mode)
