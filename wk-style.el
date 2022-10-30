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

;; Load default theme
;; (load-theme 'modus-vivendi)
(use-package dracula-theme)
(load-theme 'dracula t)

(use-package default-text-scale)

;;; wk-style.el ends here
