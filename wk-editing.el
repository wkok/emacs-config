;;; wk-editing --- wk editing

;;; Commentary:

;;; Code editing related config

;;; Code:

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode))

(use-package emacs
  :init
  (setq completion-cycle-threshold 3)
  (setq tab-always-indent 'complete))

(use-package smartparens
  :ensure t
  :delight
  :config
  (smartparens-global-strict-mode t)
  :bind (:map smartparens-mode-map
              ("C-M-f" . sp-forward-sexp)
              ("C-M-b" . sp-backward-sexp)
              ("C-M-d" . sp-down-sexp)
              ("C-M-a" . sp-backward-down-sexp)
              ("C-M-e" . sp-up-sexp)
              ("C-M-u" . sp-backward-up-sexp)
              ("C-M-t" . sp-transpose-sexp)
              ("C-M-n" . end-of-defun)
              ("C-M-p" . beginning-of-defun)
              ("C-M-k" . sp-kill-sexp)
              ("C-M-w" . sp-copy-sexp)
              ("C-<right>" . sp-forward-slurp-sexp)
              ("C-<left>" . sp-forward-barf-sexp)
              ("C-]" . sp-select-next-thing-exchange)
              ("C-<left_bracket>" . sp-select-previous-thing)
              ("C-M-]" . sp-select-next-thing)
              ("M-F" . sp-forward-symbol)
              ("M-B" . sp-backward-symbol)))

(use-package smartparens-config
  :ensure smartparens)

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package undo-tree
  :ensure t
  :init
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
  (global-undo-tree-mode))

(use-package markdown-mode
    :ensure t)

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(use-package emacs
  :init
  (global-visual-line-mode)
  (breadcrumb-mode))

;;; wk-editing.el ends hereb
