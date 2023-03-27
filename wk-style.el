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
(load-theme 'modus-vivendi)
;; (use-package dracula-theme)
;; (load-theme 'dracula t)

(if (< emacs-major-version 29)
    (use-package default-text-scale))

;; When enabled, and if your mouse supports it, you can scroll the display up or down at pixel resolution,
;; according to what your mouse wheel reports. Unlike ‘pixel-scroll-mode’, this mode scrolls the display pixel-by-pixel,
;; as opposed to only animating line-by-line scrolls.
;; From emacs 29
(if (>= emacs-major-version 29)
    (pixel-scroll-precision-mode))

;;; wk-style.el ends here
