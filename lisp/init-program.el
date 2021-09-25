;;; init-program --- General programming mode configuration

;;; Commentary:

;;; Code:

(show-paren-mode 1)
(setq show-paren-style 'mixed)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package filladapt)

(use-package flycheck
  :init (global-flycheck-mode))

;; Note: we want to be able to override the face color depending on the theme.
(if (not (boundp 'tcb-hif-column))
    (defconst tcb-hif-column "#505050"))

(if (not (boundp 'tcb-hif-current))
    (defconst tcb-hif-current "#707070"))

(use-package highlight-indentation
  :hook ((yaml-mode . highlight-indentation-mode)
	 (python-mode . highlight-indentation-mode))
  :config (set-face-background 'highlight-indentation-face tcb-hif-column))

 
;; lsp-mode

;; etc.

(provide 'init-program)
;;; init-program.el ends here
