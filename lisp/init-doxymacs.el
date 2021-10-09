;;; init-doxymacs --- Configure Doxygen support

;;; Commentary:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Doxymacs
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Does this belong in "init-program.el"?

;;; Code:

(if (not (and (boundp 'tcb-no-doxymacs-p) tcb-no-doxymacs-p))
    (progn
      ;; (require 'doxymacs)

      (setq doxymacs-doxygen-style "C++")

      (defun my-doxymacs-font-lock-hook ()
	(if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
	    (doxymacs-font-lock)))
      (add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)
      
      (add-hook 'c-mode-common-hook 'doxymacs-mode)
      (add-hook 'c-mode-common-hook 'tcb-doxy-hook t)
      )
  )

;; Override doxymacs templates that I don't like.
;; This can be outside of the doxymacs conditional test, since it just defines
;; the constant/value, and doesn't actually call any doxymacs functions yet.

(defconst doxymacs-file-comment-template
 '("///////////////////////////////////////////////////////////////////////////////" > n
   "/// " > n
   "/// @file   "
   (if (buffer-file-name)
       (file-name-nondirectory (buffer-file-name))
     "") > n
   "/// " > n
   "/// @author " (user-full-name)
   (if (fboundp 'user-mail-address)
       (list 'l " <" (user-mail-address) ">"))
   > n
   "/// " > n
   "/// @date   " (current-time-string) > n
   "/// " > n
   "/// @brief  " (p "Brief description of this file: ") > n
   "/// " > n
   "/// " p > n
   "///////////////////////////////////////////////////////////////////////////////" > n)
 "Default TCB-style template for file documentation.")

(provide 'init-doxymacs)
;;; init-doxymacs.el ends here
