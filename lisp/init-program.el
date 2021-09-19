;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  General Programming
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(show-paren-mode 1)
(setq show-paren-style 'mixed)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package filladapt)

;; lsp-mode

;; UNTESTED:
(use-package flycheck
  :init (global-flycheck-mode))
;;
;; For OSX:
;; (use-package exec-path-from-shell)
;; (exec-path-from-shell-initialize)


;; etc.

(provide 'init-program)
