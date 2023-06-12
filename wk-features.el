;;; wk-features --- wk features

;;; Commentary:

;;; Extra features adding more capability

;;; Code:

;; Does not seem to be available in melpa-stable
(use-package restclient
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.rest" . restclient-mode)))

(use-package plantuml-mode
  :ensure t
  :init
  (setq plantuml-jar-path "/opt/plantuml/plantuml.jar")
  (setq plantuml-default-exec-mode 'jar)
  (setq plantuml-output-type "png")

  ;; to get rid of the --illegal-access=deny arg that fails preview
  (setq plantuml-java-args (list "-Djava.awt.headless=true" "-jar"))

  (add-to-list 'auto-mode-alist '("\\.puml\\'" . plantuml-mode)))


(use-package exec-path-from-shell
  :ensure t
  :init (exec-path-from-shell-initialize))

;;; wk-features.el ends here
