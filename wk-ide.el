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

(require 'eglot)
(add-hook 'prog-mode-hook #'eglot-ensure)
(setq eglot-connect-timeout 300)
(setq eglot-extend-to-xref t)

(use-package jarchive
  :pin gnu
  :config (jarchive-setup))

(defun jarchive-patch-eglot ()
  "Patch old versions of Eglot to work with Jarchive."
  (interactive) ;; TODO, remove when eglot is updated in melpa
  (advice-add 'eglot--path-to-uri :around #'jarchive--wrap-legacy-eglot--path-to-uri)
  (advice-add 'eglot--uri-to-path :around #'jarchive--wrap-legacy-eglot--uri-to-path)
  (message "[jarchive] Eglot successfully patched."))

(jarchive-patch-eglot)

;; For the reloaded workflow, reset the application
(defun nrepl-reset ()
  (interactive)
  (cider-switch-to-repl-buffer)
  (goto-char (point-max))
  (insert "(reset)")
  (funcall (lookup-key (current-local-map) (kbd "RET")))
  (cider-switch-to-last-clojure-buffer))

(use-package clojure-mode
  :ensure nil
  :bind (("C-M-+" . nrepl-reset)))

;;; wk-ide.el ends here
