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

(use-package yaml-mode)

(use-package json-mode)

(use-package web-mode
  :ensure t
  :mode (("\\.ts\\'" . web-mode)
         ("\\.js\\'" . web-mode)
         ("\\.mjs\\'" . web-mode)
         ("\\.tsx\\'" . web-mode)
         ("\\.jsx\\'" . web-mode))
  :config
  (setq web-mode-content-types-alist
        '(("jsx" . "\\.js[x]?\\'"))))

(require 'eglot)
(use-package eglot
  :ensure nil
  :hook (prog-mode . eglot-ensure)
  :init
  (add-to-list 'eglot-server-programs '(web-mode . ("typescript-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs '(dockerfile-mode . ("docker-langserver" "--stdio")))
  (add-to-list 'eglot-server-programs '(dockerfile-ts-mode . ("docker-langserver" "--stdio")))
  (add-to-list 'eglot-server-programs '(java-ts-mode . eglot-java--eclipse-contact))
  :config
  (setq eglot-connect-timeout 300)
  (setq eglot-extend-to-xref t))

(defun jarchive-patch-eglot-override ()
  "Patch old versions of Eglot to work with Jarchive."
  (interactive) ;; TODO, remove when eglot is updated in melpa
  (advice-add 'eglot--path-to-uri :around #'jarchive--wrap-legacy-eglot--path-to-uri)
  (advice-add 'eglot--uri-to-path :around #'jarchive--wrap-legacy-eglot--uri-to-path)
  (message "[jarchive] Eglot successfully patched."))

(use-package jarchive
  :pin gnu
  :config
  (jarchive-setup)
  (jarchive-patch-eglot-override))

(use-package eglot-java
  :pin melpa)
(add-hook 'java-mode-hook 'eglot-java-mode)
(add-hook 'eglot-java-mode-hook (lambda ()
  (define-key eglot-java-mode-map (kbd "C-c l n") #'eglot-java-file-new)
  (define-key eglot-java-mode-map (kbd "C-c l x") #'eglot-java-run-main)
  (define-key eglot-java-mode-map (kbd "C-c l t") #'eglot-java-run-test)
  (define-key eglot-java-mode-map (kbd "C-c l N") #'eglot-java-project-new)
  (define-key eglot-java-mode-map (kbd "C-c l T") #'eglot-java-project-build-task)
  (define-key eglot-java-mode-map (kbd "C-c l R") #'eglot-java-project-build-refresh)))

(use-package treesit-auto
  :config
  (global-treesit-auto-mode))

;;; wk-ide.el ends here
