;;; wk-ide --- wk ide

;;; Commentary:

;;; Integrated Development Environment related config

;;; Code:

(use-package magit)

(use-package cider)

(use-package yaml-mode)

(use-package json-mode)

(use-package which-key
    :config
    (which-key-mode))

(use-package selectrum
  :config (selectrum-mode))

(use-package selectrum-prescient
  :config
  (selectrum-prescient-mode)
  (prescient-persist-mode))

(use-package flycheck
  :init (global-flycheck-mode))

(use-package flycheck-clj-kondo)

(use-package yasnippet
  :config
  (yas-global-mode))

(use-package yasnippet-snippets
  :after yasnippet)

;;; wk-ide.el ends here
