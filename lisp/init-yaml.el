;;; init-yaml --- Configure YAML mode

;;; Commentary:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  YAML
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Code:

(if (not (and (boundp 'tcb-no-yaml-p) tcb-no-yaml-p))
    (progn
      (use-package yaml-mode
	:mode ("\\.yml\\'" "\\.yaml\\'")
      )
  )
  )

(provide 'init-yaml)
;;; init-yaml.el ends here
