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
   ("C-M-n" . sp-next-sexp)
   ("C-M-p" . sp-previous-sexp)
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

;;; wk-editing.el ends here
