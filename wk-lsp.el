;;; wk-lsp --- wk lsp

;;; Commentary:

;;; LSP related config

;;; Code:

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-lens-enable nil)
  :hook ((clojure-mode . lsp)
         (clojurec-mode . lsp)
         (clojurescript-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui :commands lsp-ui-mode)

(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(use-package lsp-java :config (add-hook 'java-mode-hook 'lsp))

;;; wk-lsp.el ends here
