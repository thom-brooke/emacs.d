;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Keybindings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Mac-isms:
(global-set-key (kbd "<home>") 'beginning-of-line)
(global-set-key (kbd "<end>") 'end-of-line)

; My preferences:
(global-set-key "\C-x\C-g" 'goto-line)
(global-set-key "\C-x\C-k" 'kill-this-buffer)
(global-set-key "\C-x\C-m" 'auto-fill-mode)   ; read this as "margin"
(global-set-key "\C-c\C-m" 'compile)

(provide 'init-keybindings)
