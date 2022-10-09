;;; wk-lsp --- wk lsp

;;; Commentary:

;;; LSP related config

;;; Code:

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook ((clojure-mode . lsp))
  :commands lsp)

(use-package lsp-ui :commands lsp-ui-mode)

(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(use-package flycheck
  :init (global-flycheck-mode))

;;; wk-lsp.el ends here
