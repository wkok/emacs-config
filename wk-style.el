;;; wk-style --- wk style

;;; Commentary:

;;; UI related

;;; Code:

;; Do not show menu bar
(menu-bar-mode -1)

;; Do not show tool bar.
(tool-bar-mode -1)

;; Do not show scroll bar.
(scroll-bar-mode -1)

;; Highlight line on point.
(global-hl-line-mode t)

;; Line numbers
(global-display-line-numbers-mode t)

;; ELDoc
(setq eldoc-echo-area-use-multiline-p nil)

;; Load default theme
(load-theme 'modus-operandi)
;; (use-package dracula-theme)
;; (load-theme 'dracula t)

(pixel-scroll-precision-mode)

(setq-default cursor-type '(bar . 2))

;;; wk-style.el ends here
