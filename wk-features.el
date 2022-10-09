;;; wk-features --- wk features

;;; Commentary:

;;; Extra features adding more capability

;;; Code:

(use-package restclient)

;; Provides auto-completion for HTTP methods and headers
(use-package company-restclient)
(add-to-list 'company-backends 'company-restclient)

(use-package plantuml-mode)

;;; wk-features.el ends here
