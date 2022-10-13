;;; wk-package --- wk package

;;; Commentary:

;;; Package related config

;;; Code:

(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/") t)

(setq-default

 ;; Automatically :ensure each use-package.
 use-package-always-ensure t

 ;; Default value for :pin in each use-package.
 use-package-always-pin "melpa-stable")

;; Load and activate emacs packages. Do this first so that the packages are loaded before
;; you start trying to modify them.  This also sets the load path.
(package-initialize)

;; Install 'use-package' if it is not installed.
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;;; wk-package.el ends here
