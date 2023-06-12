;;; wk-ide --- wk ide

;;; Commentary:

;;; Integrated Development Environment related config

;;; Code:

(use-package magit
  :ensure t)

(use-package cider
  :ensure t
  :init

  ;; true makes emacs hang when point moves into comment block ??
  (setq clojure-toplevel-inside-comment-form nil)

  ;; So that "M-." and "M-?" instead get delegated to eglot
  (setq cider-xref-fn-depth 90))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(use-package savehist
  :ensure nil
  :init
  (savehist-mode))

(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

(use-package flymake
  :ensure nil
  :bind (("M-n" . flymake-goto-next-error)
         ("M-p" . flymake-goto-prev-error))
  :hook (prog-mode . (lambda () (flymake-mode t)))
  :config (remove-hook 'flymake-diagnostic-functions #'flymake-proc-legacy-flymake))

(use-package flymake-kondor
  :ensure t
  :hook (clojure-mode . flymake-kondor-setup))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)

(use-package dockerfile-mode
  :ensure t)

;; For the reloaded workflow, reset the application
(defun nrepl-reset ()
  (interactive)
  (cider-switch-to-repl-buffer)
  (goto-char (point-max))
  (insert "(restart!)")
  (funcall (lookup-key (current-local-map) (kbd "RET")))
  (cider-switch-to-last-clojure-buffer))

(use-package clojure-mode
  :ensure nil
  :bind (("C-M-+" . nrepl-reset))
  :config
  (setq clojure-indent-style 'align-arguments))

(use-package yaml-mode
  :ensure t)

(use-package json-mode
  :ensure t)

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
  (add-to-list 'eglot-server-programs '(bash-ts-mode . ("bash-language-server" "start")))
  :config
  (setq eglot-connect-timeout 300)
  (setq eglot-extend-to-xref t)
  ;; (setq eglot-events-buffer-size 0)
  )

(defun jarchive-patch-eglot-override ()
  "Patch old versions of Eglot to work with Jarchive."
  (interactive) ;; TODO, remove when eglot is updated in melpa
  (advice-add 'eglot--path-to-uri :around #'jarchive--wrap-legacy-eglot--path-to-uri)
  (advice-add 'eglot--uri-to-path :around #'jarchive--wrap-legacy-eglot--uri-to-path)
  (message "[jarchive] Eglot successfully patched."))

(use-package jarchive
  :ensure t
  :config
  (jarchive-setup)
  (jarchive-patch-eglot-override))

(use-package eglot-java
  :ensure t)
(add-hook 'java-mode-hook 'eglot-java-mode)
(add-hook 'eglot-java-mode-hook (lambda ()
  (define-key eglot-java-mode-map (kbd "C-c l n") #'eglot-java-file-new)
  (define-key eglot-java-mode-map (kbd "C-c l x") #'eglot-java-run-main)
  (define-key eglot-java-mode-map (kbd "C-c l t") #'eglot-java-run-test)
  (define-key eglot-java-mode-map (kbd "C-c l N") #'eglot-java-project-new)
  (define-key eglot-java-mode-map (kbd "C-c l T") #'eglot-java-project-build-task)
  (define-key eglot-java-mode-map (kbd "C-c l R") #'eglot-java-project-build-refresh)))

(use-package treesit-auto
  :ensure t
  :config
  (global-treesit-auto-mode))

;; Dart
(use-package dart-mode
  :ensure t)

;; Make subfolders project.el aware
(setq project-vc-extra-root-markers '(".project-child"))

;;; wk-ide.el ends here
