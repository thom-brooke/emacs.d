;;;
;;; Thom's new-and-improved Emacs configuration
;;;
;;; I'm still trying to build a single, common configuration which is tailored by system.
;;; The tailoring should be minimal, and by exception.  If there is no local config, then
;;; the initialization should have reasonable defaults.
;;;
;;; In general, I *think* I want things to go like this:
;;; 1. Load the local config (which sets some flags and settings)
;;; 2. General configuration here, in init.el, that's broad-based (packages, etc.)
;;; 3. "Require" features/packages that are complex or modular
;;;
;;; external features might include things like:
;;; * frame configuration (initial and default)
;;; * keybindings (not mode specific)
;;; * appearance (theme, modeline, etc.)
;;; * general programming (lsp-mode, flycheck, etc.)
;;; * specific packages (c-mode, auctex, etc.)
;;;

;;; tailorable settings:
;;; * tcb-theme-name
;;; * frame geometry
;;; * font

;; Put the "lisp" subdirectory (from wherever this file is found) on the load path.
;; That's where all the "features" ("init-xyz") live.
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Package Management
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package auto-package-update
  :defer 10
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  ;; Update installed packages at startup if there is an update pending.
  (auto-package-update-maybe))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Local Tailoring
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; The file "local.el" should contain any overrides needed for initialization
;; (e.g., frame sizes/offsets, disabled features, etc.)
(if (file-exists-p (expand-file-name "local.el" user-emacs-directory))
    (load (expand-file-name "local.el" user-emacs-directory)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Interface Cleanup
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq inhibit-startup-message t)
; (scroll-bar-mode -1) ; ?
(tool-bar-mode -1)
; (tooltip-mode -1)    ; ?
(set-fringe-mode 10) ; ?
(setq visible-bell t); ?


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Enhanced Behavior
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Reduce clutter in the modeline:
(use-package diminish
  :defer 5
  :config ;; Let's hide some markers.
  (diminish  'org-indent-mode))


;; Name and command expansion:
; (use-package ivy
;         :diminish
;         ; :bind (....)
;         :config
;         (ivy-mode 1)
; )

;; auto-wrap for text modes:
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq default-fill-column 100)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Features
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'init-appearance)

(require 'init-keybindings)

(require 'init-frames)

(require 'init-program)

(require 'init-cpp)

(require 'init=doxymacs)

;; XML (?)

(require 'init-yaml)

(require 'init-markdown)

(require 'init-tex)

;; python

;; etc.

;; (require 'init-org-mode) ; TBR
;
; (use-package org-bullets
;   :hook (org-mode . org-bullets-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Custom
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (filladapt rainbow-delimiters diminish auto-package-update use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
