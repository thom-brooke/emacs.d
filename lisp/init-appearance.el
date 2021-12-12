;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Appearance
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Configuration parameters:

(if (not (boundp 'tcb-theme-name))
    (defconst tcb-theme-name 'wombat))

;; Overall theme (tailor faces later?):
(load-theme tcb-theme-name t)

(setq blink-cursor-blinks 0) ; don't stop blinking

(set-face-attribute 'cursor nil :background "palegoldenrod")
(set-face-attribute 'lazy-highlight nil :foreground "black" :background "SteelBlue")
(set-face-attribute 'isearch nil :foreground "black" :background "yellow")


;; Default font for all frames (only if set)
;; See https://www.gnu.org/software/emacs/manual/html_node/emacs/Fonts.html
;; for how to specify the font name.
;; Something like "Fira Mono 9" should work.
(if (boundp 'tcb-default-font)
    (set-frame-font tcb-default-font nil t))

;;;; A working "ligature.el" is only available in emacs 28 or newer (TBR)
;; (use-package ligature)
;; ;; Enable the www ligature in every possible major mode
;; (ligature-set-ligatures 't '("www"))
;; 
;; ;; Enable ligatures in programming modes                                                        
;; (ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
;;                                      ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
;;                                      "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
;;                                      "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
;;                                      "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
;;                                      "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
;;                                      "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
;;                                      "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
;;                                      "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
;;                                      "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))
;; (global-ligature-mode 't)

;; various layout options

;; Title is "buffer-file-name" (so likely full path):
(setq frame-title-format "%f")
(setq icon-title-format "%f")

;; Include column number in the modeline:
(column-number-mode t)

; ;; Display line numbers...
; (global-display-line-numbers-mode t)
; ;; ... but not for ALL buffers:
; (dolist (mode '(org-mode-hook term-mode-hook eshell-mode-hook))
;   (add-hook mode (lambda () (display-line-numbers-mode 0))))

; (mouse-avoidance-mode 'animate)
; (show-paren-mode t) ; (is this needed with "rainbow-delimiters"?)

; (add-hook 'text-mode-hook 'turn-on-auto-fill)
; (setq default-fill-column 80)

;; Prettify the modeline (with icons and such):
; (use-package doom-modeline
;         :init (doom-modeline-mode 1))
; 

(provide 'init-appearance)
