;;; init-markdown --- Configure for Markdown editing

;;; Commentary:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Markdown
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Code:

(if (not (boundp 'tcb-markdown-command))
    (defconst tcb-markdown-command nil))

(if (not (and (boundp 'tcb-no-markdown-p) tcb-no-markdown-p))
    (progn
      (use-package markdown-mode
	:commands (markdown-mode gfm-mode)
	:mode (("README\\.md\\'" . gfm-mode)
	       ("\\.md\\'" . markdown-mode)
	       ("\\.markdown\\'" . markdown-mode))
	:init (setq markdown-command tcb-markdown-command))
      )
  )

 
(provide 'init-markdown)
;;; init-markdown.el ends here
