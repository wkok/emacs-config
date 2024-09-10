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
(load-theme 'modus-vivendi)
;; (use-package dracula-theme)
;; (load-theme 'dracula t)

(pixel-scroll-precision-mode)

;; (setq-default cursor-type '(bar . 2))

;; Start fullscreen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Add some spacing
(use-package spacious-padding
  :ensure t
  :init
  (setq spacious-padding-subtle-mode-line t)
  (setq spacious-padding-widths
      '( :internal-border-width 10
         :header-line-width 4
         :mode-line-width 4
         :tab-width 4
         :right-divider-width 10
         :scroll-bar-width 8
         :fringe-width 8))
  (spacious-padding-mode))



;;; wk-style.el ends here
