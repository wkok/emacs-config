;;; wk-ide --- wk ide

;;; Commentary:

;;; Integrated Development Environment related config

;;; Code:

(use-package magit)

(use-package cider
  :init
  (setq clojure-toplevel-inside-comment-form t)

  ;; So that "M-." and "M-?" instead get delegated to eglot
  (setq cider-xref-fn-depth 90))

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
  ;; (setq eglot-events-buffer-size 0)
  :hook ((clojure-mode . eglot-ensure)
         (clojurec-mode . eglot-ensure)
         (clojurescript-mode . eglot-ensure)
         (java-mode . eglot-ensure)
         (sh-mode) . eglot-ensure)
         (dockerfile-mode . eglot-ensure))

(use-package clj-deps-new
  :pin melpa)

(defun nrepl-reset ()
  (interactive)
  (cider-switch-to-repl-buffer)
  (goto-char (point-max))
  (insert "(reset)")
  (funcall (lookup-key (current-local-map) (kbd "RET")))
  (cider-switch-to-last-clojure-buffer))

;; For the reloaded workflow, reset the application
(use-package clojure-mode
  :ensure nil
  :bind (("C-M-+" . nrepl-reset)))

;;; wk-ide.el ends here
