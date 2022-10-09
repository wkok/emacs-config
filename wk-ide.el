;;; wk-ide --- wk ide

;;; Commentary:

;;; Integrated Development Environment related config

;;; Code:

(use-package magit
  :bind ("C-x g" . magit-status))

;; Display possible completions at all places
(use-package cider)

(use-package projectile
  :diminish projectile
  :config
  (projectile-global-mode)
  :bind (("<f6>" . projectile-ag)
         ("C-<f6>" . projectile-replace)
         ("<f7>" . projectile-find-file)
         ("<f8>" . projectile-run-shell)
         ("<f9>" . projectile-command-map)
         :map projectile-mode-map
         ("s-d" . projectile-find-dir)
         ("s-p" . projectile-switch-project)
         ("s-f" . projectile-find-file)
         ("s-a" . projectile-ag))
  :custom
  (projectile-completion-system 'default))

(use-package selectrum
  :config (selectrum-mode))

(use-package selectrum-prescient
  :config (selectrum-prescient-mode))

;;; wk-ide.el ends here
