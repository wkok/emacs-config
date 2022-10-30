;;; wk-features --- wk features

;;; Commentary:

;;; Extra features adding more capability

;;; Code:

;; Does not seem to be available in melpa-stable
(use-package restclient
  :init
  (add-to-list 'auto-mode-alist '("\\.rest" . restclient-mode))
  :pin melpa)

;; Provides auto-completion for HTTP methods and headers
(use-package company-restclient)
(add-to-list 'company-backends 'company-restclient)

(use-package plantuml-mode
  :init
  (setq plantuml-jar-path "/opt/plantuml/plantuml.jar")
  (setq plantuml-default-exec-mode 'jar)
  (setq plantuml-output-type "png")

  ;; to get rid of the --illegal-access=deny arg that fails preview
  (setq plantuml-java-args (list "-Djava.awt.headless=true" "-jar"))
  (add-to-list 'auto-mode-alist '("\\.puml\\'" . plantuml-mode)))

;;; wk-features.el ends here
