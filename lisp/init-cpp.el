;;; init-cpp --- Settings for cc-mode

;;; Commentary

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; C/C++
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Code:

(if (not (boundp 'tcb-fill-column))
    (defconst tcb-fill-column 120))


(if (not (and (boundp 'tcb-no-cpp-p) tcb-no-cpp-p))
    (progn
      
      (defun tcb-c-indent ()
	(define-key c-mode-base-map "\C-m" 'c-context-line-break))
      (add-hook 'c-initialization-hook 'tcb-c-indent)

      ;; personal C++ style

      (c-add-style "TCB-CC"
		   '("stroustrup"
		     (c-tab-always-indent . t)
		     (c-basic-offset . 4)	; Guessed value
		     (c-hanging-braces-alist     . ((substatement-open before after)
						    (brace-list-open)
						    (brace-list-close after)
						    ))
		     (c-hanging-colons-alist     . (; (member-init-intro before)
					; (inher-intro)
						    (case-label after)
						    (label after)
						    (access-label after)
						    ))
		     (c-cleanup-list             . (scope-operator
					;					      empty-defun-braces
						    defun-close-semi
						    list-close-comma
						    one-liner-defun
						    ))
		     (c-offsets-alist
		      (block-close . 0)	; Guessed value
		      (brace-entry-open . 0)	; Guessed value
		      (brace-list-close . 0)	; Guessed value
		      (brace-list-intro . +)	; Guessed value
		      (brace-list-open . 0)	; Guessed value
		      (case-label . 0)	; Guessed value
		      (class-close . 0)	; Guessed value
		      (class-open . 0)	; Guessed value
		      (defun-block-intro . +)	; Guessed value
		      (defun-close . 0)	; Guessed value
		      (defun-open . 0)	; Guessed value
		      (inclass . +)		; Guessed value
		      (innamespace . 0)	; Guessed value
		      (member-init-intro . +)	; Guessed value
		      (namespace-close . 0)	; Guessed value
		      (namespace-open . 0)	; Guessed value
		      (statement . 0)		; Guessed value
		      (statement-block-intro . +) ; Guessed value
		      (statement-case-intro . +) ; Guessed value
		      (substatement . +)	   ; Guessed value
		      (substatement-open . 0)	; Guessed value
		      (topmost-intro . 0)	; Guessed value
		      (topmost-intro-cont . 0) ; Guessed value
		      (access-label . -)
		      (annotation-top-cont . 0)
		      (annotation-var-cont . +)
		      (arglist-close . c-lineup-close-paren)
		      (arglist-cont c-lineup-gcc-asm-reg 0)
		      (arglist-cont-nonempty . c-lineup-arglist)
		      (arglist-intro . +)
		      (block-open . 0)
		      (brace-list-entry . 0)
		      (c . c-lineup-C-comments)
		      (catch-clause . 0)
		      (comment-intro . c-lineup-comment)
		      (composition-close . 0)
		      (composition-open . 0)
		      (cpp-define-intro c-lineup-cpp-define +)
		      (cpp-macro . -1000)
		      (cpp-macro-cont . +)
		      (do-while-closure . 0)
		      (else-clause . 0)
		      (extern-lang-close . 0)
		      (extern-lang-open . 0)
		      (friend . 0)
		      (func-decl-cont . +)
		      (incomposition . +)
		      (inexpr-class . +)
		      (inexpr-statement . +)
		      (inextern-lang . +)
		      (inher-cont . c-lineup-multi-inher)
		      (inher-intro . +)
		      (inlambda . c-lineup-inexpr-block)
		      (inline-close . 0)
		      (inline-open . 0)
		      (inmodule . +)
		      (knr-argdecl . 0)
		      (knr-argdecl-intro . +)
		      (label . 0)
		      (lambda-intro-cont . +)
		      (member-init-cont . c-lineup-multi-inher)
		      (module-close . 0)
		      (module-open . 0)
		      (objc-method-args-cont . c-lineup-ObjC-method-args)
		      (objc-method-call-cont c-lineup-ObjC-method-call-colons c-lineup-ObjC-method-call +)
		      (objc-method-intro .
					 [0])
		      (statement-case-open . 0)
		      (statement-cont . +)
		      (stream-op . c-lineup-streamop)
		      (string . -1000)
		      (substatement-label . 0)
		      (template-args-cont c-lineup-template-args +)
		      ))
		   )

      (c-add-style "NCW-CC"
		   '("stroustrup"
		     (c-tab-always-indent . t)
		     (c-basic-offset . 4)	; Guessed value
		     (c-hanging-braces-alist     . ((substatement-open before after)
						    (brace-list-open)
						    (brace-list-close after)
						    ))
		     (c-hanging-colons-alist     . (; (member-init-intro before)
					; (inher-intro)
						    (case-label after)
						    (label after)
						    (access-label after)
						    ))
		     (c-cleanup-list             . (scope-operator
						    empty-defun-braces
						    defun-close-semi
						    list-close-comma
						    compact-empty-funcall
					;					      one-liner-defun
						    ))
		     (c-offsets-alist
		      (access-label . -)	; Guessed value
		      (arglist-cont . 0)	; Guessed value
		      (arglist-intro . +)	; Guessed value
		      (block-close . 0)	; Guessed value
		      (brace-list-close . 0)	; Guessed value
		      (brace-list-entry . 0)	; Guessed value
		      (brace-list-intro . +)	; Guessed value
		      (brace-list-open . 0)	; Guessed value
		      (case-label . +)	; Guessed value
		      (class-close . 0)	; Guessed value
		      (class-open . 0)	; Guessed value
		      (defun-block-intro . +)	; Guessed value
		      (defun-close . 0)	; Guessed value
		      (defun-open . 0)	; Guessed value
		      (else-clause . 0)	; Guessed value
		      (inclass . +)		; Guessed value
		      (inline-close . 0)	; Guessed value
		      (innamespace . 0)	; Guessed value
		      (member-init-cont . 0)	; Guessed value
		      (member-init-intro . +)	; Guessed value
		      (namespace-close . 0)	; Guessed value
		      (namespace-open . 0)	; Guessed value
		      (statement . 0)		    ; Guessed value
		      (statement-block-intro . +) ; Guessed value
		      (statement-case-open . 0) ; Guessed value
		      (statement-cont . +)	  ; Guessed value
		      (substatement . +)	  ; Guessed value
		      (substatement-open . 0)	; Guessed value
		      (topmost-intro . 0)	; Guessed value
		      (topmost-intro-cont . 0) ; Guessed value
		      (annotation-top-cont . 0)
		      (annotation-var-cont . +)
		      (arglist-close . c-lineup-close-paren)
		      (arglist-cont-nonempty . c-lineup-arglist)
		      (block-open . 0)
		      (brace-entry-open . 0)
		      (c . c-lineup-C-comments)
		      (catch-clause . 0)
		      (comment-intro . c-lineup-comment)
		      (composition-close . 0)
		      (composition-open . 0)
		      (cpp-define-intro c-lineup-cpp-define +)
		      (cpp-macro . -1000)
		      (cpp-macro-cont . +)
		      (do-while-closure . 0)
		      (extern-lang-close . 0)
		      (extern-lang-open . 0)
		      (friend . 0)
		      (func-decl-cont . +)
		      (incomposition . +)
		      (inexpr-class . +)
		      (inexpr-statement . +)
		      (inextern-lang . +)
		      (inher-cont . c-lineup-multi-inher)
		      (inher-intro . +)
		      (inlambda . c-lineup-inexpr-block)
		      (inline-open . +)
		      (inmodule . +)
		      (knr-argdecl . 0)
		      (knr-argdecl-intro . +)
		      (label . 0)
		      (lambda-intro-cont . +)
		      (module-close . 0)
		      (module-open . 0)
		      (objc-method-args-cont . c-lineup-ObjC-method-args)
		      (objc-method-call-cont c-lineup-ObjC-method-call-colons c-lineup-ObjC-method-call +)
		      (objc-method-intro .
					 [0])
		      (statement-case-intro . +)
		      (stream-op . c-lineup-streamop)
		      (string . -1000)
		      (substatement-label . 0)
		      (template-args-cont c-lineup-template-args +))))
      
      ;; name of default style for c/c++ code.
      (if (not (boundp 'tcb-c-default))
	  (defconst tcb-c-default "TCB-CC"))
      
      (defun tcb-c-hook ()
	(c-set-style tcb-c-default)
	;;
	(setq c-basic-offset 4)
					;  (c-set-offset 'innamespace 0)
					;  (c-set-offset 'arglist-close 0)
					;  (c-set-offset 'inextern-lang 0)
	(setq delete-key-deletes-forward t)
	(setq tab-width 4
	      indent-tabs-mode nil)
	(auto-fill-mode)
	(setq fill-column tcb-fill-column)
	(c-setup-filladapt)
	(filladapt-mode 1)
	(c-toggle-auto-hungry-state 1)
	)
      
      (add-hook 'c-mode-common-hook 'tcb-c-hook)
      
      (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
      (add-to-list 'auto-mode-alist '("\\.dox\\'" . c++-mode))
      (add-to-list 'auto-mode-alist '("\\.ino\\'" . c++-mode))
      )
  )

(provide 'init-cpp)
;;; init-cpp.el ends here
