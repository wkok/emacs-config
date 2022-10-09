;;; wk-features --- wk features

;;; Commentary:

;;; Extra features adding more capability

;;; Code:

(use-package restclient
  :init
  (add-to-list 'auto-mode-alist '("\\.rest" . restclient-mode))
  :config
  (add-hook 'restclient-mode-hook 'outline-minor-mode)
  (add-hook 'restclient-mode-hook
            (lambda ()
              (outline-minor-mode t)
              (local-set-key (kbd "<tab>") 'outline-toggle-children)
              (setq outline-regexp "#+"))))

(use-package plantuml-mode)

;;; wk-features.el ends here
