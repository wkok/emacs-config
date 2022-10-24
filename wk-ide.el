;;; wk-ide --- wk ide

;;; Commentary:

;;; Integrated Development Environment related config

;;; Code:

(use-package magit)

(use-package cider)

(use-package which-key
    :config
    (which-key-mode))

(use-package selectrum
  :config (selectrum-mode))

(use-package selectrum-prescient
  :config
  (selectrum-prescient-mode)
  (prescient-persist-mode))

(use-package flymake
  :ensure nil
  :bind (("M-n" . flymake-goto-next-error)
         ("M-p" . flymake-goto-prev-error))
  :hook (prog-mode . (lambda () (flymake-mode t)))
  :config (remove-hook 'flymake-diagnostic-functions #'flymake-proc-legacy-flymake))

(use-package flymake-kondor
  :hook (clojure-mode . flymake-kondor-setup))

(use-package yasnippet
  :config
  (yas-global-mode))

(use-package yasnippet-snippets
  :after yasnippet)

(use-package dockerfile-mode)

(use-package eglot
  :init
  (setq eglot-connect-timeout 300)
  :hook ((clojure-mode . eglot-ensure)
         (clojurec-mode . eglot-ensure)
         (clojurescript-mode . eglot-ensure)
         (java-mode . eglot-ensure)
         (sh-mode) . eglot-ensure)
         (dockerfile-mode . eglot-ensure))

;;; wk-ide.el ends here
