;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; TeX and LaTeX
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Note:  this is based on the "old stuff"

;; If not disabled:
(if (not (and (boundp 'tcb-no-tex-p) tcb-no-tex-p))
    (progn
      ;; already loaded? (use-package auctex)
      (require 'reftex)
      (message "loading TeX stuff")
      (setq LaTeX-verbatim-environments-local '("Verbatim" "lstlisting"))
      (setq TeX-PDF-mode t)
      (add-hook 'TeX-mode-hook 'LaTeX-math-mode)
      (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
      (setq reftex-plug-into-AUCTeX t)
      (setq reftex-use-external-file-finders t)
      (setq reftex-external-file-finders
	    '(("tex" . "kpsewhich -format=.tex %f")
	      ("bib" . "kpsewhich -format=.bib %f")))
      
      (add-to-list 'reftex-ref-style-default-list "Hyperref")
      
      (add-hook 'LaTeX-mode-hook
		(lambda() (TeX-fold-mode 1) ; press C-c C-o C-b to fold everything.
		  (add-hook 'find-file-hook 'TeX-fold-buffer t)
		  ))
      
;;; 	; others to consider:
;;; 	; (setq TeX-auto-save t)
;;; 	; (setq TeX-parse-self t)
;;; 	; (setq-default TeX-master nil)
      
      )
  )

(provide 'init-tex)
