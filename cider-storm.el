;;; coder-storm --- cider storm

;;; Commentary:

;;; Code editing related config

;;; Code:

(add-to-list 'load-path "~/src/cider-storm")

(require 'cider-storm)

(add-to-list 'safe-local-variable-values
             '(cider-jack-in-nrepl-middlewares . ("flow-storm.nrepl.middleware/wrap-flow-storm"
                                                  "cider.nrepl/cider-middleware")))


;;; cider-storm.el ends here
