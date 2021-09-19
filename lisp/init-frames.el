;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Frame Geometry
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This defines the geometry of the initial frame, as well as all "new" frames.
;; In general, I want my initial frame to be 100 characters wide and full height
;; on the right edge of the primary monitor.  I want subsequent frames to be 100
;; characters wide and ... shorter.  Don't really care about left/top (TBR).
;;
;; Specify "borders" for adjustments to this (e.g., to give extra space on some targets).

(if (not (boundp 'tcb-border-top))
    (defconst tcb-border-top 0))

(if (not (boundp 'tcb-border-left))
    (defconst tcb-border-left 0))

(if (not (boundp 'tcb-border-bottom))
    (defconst tcb-border-bottom 0))

(if (not (boundp 'tcb-border-right))
    (defconst tcb-border-right 0))

;; then dimensions, if not already set.
(if (not (boundp 'tcb-initial-top))
    (defconst tcb-initial-top tcb-border-top))

(if (not (boundp 'tcb-initial-width))
    (defconst tcb-initial-width 120))

;; "left = -1" doesn't work; the frame hangs WAY off the right edge of the screen.
;; "pixel-width - (initial-width * char-width)" gives the same result.
;; "pixel-width - ( (intial-width + 6) * char-width)" STILL hangs off the right edge
;; (even though the reported frame-pixel-width + calculated left == display width).
;; SOOOOO add an extra nudge.

(defconst tcb-workarea (assq 'workarea (car (display-monitor-attributes-list))))
;; (workarea <px-left> <px-top> <px-width> <px-height>)

(if (not (boundp 'tcb-initial-left))
    (defconst tcb-initial-left ; (- -1 tcb-border-right)))
      (+ (nth 1 tcb-workarea)
	 (- (nth 3 tcb-workarea)
	    (* (+ tcb-initial-width 6) (frame-char-width))
	    tcb-border-right
	    )
	 )
      )
  )

(if (not (boundp 'tcb-initial-height))
    (defconst tcb-initial-height
      (/ (- (nth 4 tcb-workarea)
	    tcb-border-bottom
	    tcb-border-top)
	 (frame-char-height)
	 )
      )
  )

;; now define the initial frame.
;; "setq" here, because there is no initial-frame-alist until we define it.
(setq initial-frame-alist
	   `((top . ,tcb-initial-top) 
	     (left . ,tcb-initial-left)
	     (width . ,tcb-initial-width) 
	     (height . ,tcb-initial-height)
	     (vertical-scroll-bars . right)
	     (user-position t); for Unix to "keep" settings
	     ))

;; Second, set up the defaults for additional frames.
;; Use emacs defaults here if not specified in local.el.  Since the
;; default-frame-alist DOES already exist, add new settings to it,
;; rather than completely [re]defining.

(if (boundp 'tcb-default-top)
    (add-to-list 'default-frame-alist `(top . ,tcb-default-top)))

(if (boundp 'tcb-default-left)
    (add-to-list 'default-frame-alist `(left . ,tcb-default-left)))

(if (boundp 'tcb-default-width)
    (add-to-list 'default-frame-alist `(width . ,tcb-default-width)))

(if (boundp 'tcb-default-height)
    (add-to-list 'default-frame-alist `(height . ,tcb-default-height)))

(if (boundp 'tcb-default-font)
    (add-to-list 'default-frame-alist `(font . ,tcb-default-font)))

;; for Unix, convince the window manager to accept the settings:
(setq default-frame-alist
      (append default-frame-alist 
	      '((vertical-scroll-bars . right)
		(user-position t)
		)))

(provide 'init-frames)
