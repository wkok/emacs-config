;;; wk-editing --- wk editing

;;; Commentary:

;;; Code editing related config

;;; Code:

(use-package company
  :bind (:map
         global-map
         ("TAB" . company-indent-or-complete-common))
  :config
  (global-company-mode t)
  :custom
  (company-idle-delay nil)
  :diminish nil)

(use-package smartparens
  :delight
  :config
  (smartparens-global-strict-mode t)
  :bind
  (("C-M-f" . sp-forward-sexp)
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
  :bind ("C-=" . er/expand-region))

(use-package undo-tree
  :pin gnu
  :init
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
  (global-undo-tree-mode))

(use-package markdown-mode)

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; Make copy from host to emacs work
;; see: https://github.com/doomemacs/doomemacs/issues/5219
(if (eq window-system 'pgtk)
    (setq x-select-request-type 'text/plain\;charset=utf-8))

;; Make copy from emacs to host clipboard work
(defun copy-the-thing-properly ()
  (interactive)
  (funcall interprogram-cut-function
           (substring-no-properties (car kill-ring))))

;;; wk-editing.el ends hereb
