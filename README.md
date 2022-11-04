# emacs-config

Configure ~/.emacs

```
;;; .emacs --- emacs config

;;; Commentary:

;;; Emacs config entry point

;;; Code:

(add-to-list 'load-path "~/src/emacs-config/")

(load-library "wk-package")
(load-library "wk-defaults")
(load-library "wk-style")
(load-library "wk-editing")
(load-library "wk-ide")
(load-library "wk-features")
(load-library "jarchive")

;;; .emacs ends here

```
