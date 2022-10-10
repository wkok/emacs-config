;;; wk-lsp --- wk lsp

;;; Commentary:

;;; LSP related config

;;; Code:

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :bind (("M-?" . lsp-find-definition)
         ("M-'" . lsp-treemacs-call-hierarchy)
         ("C-c r" . lsp-menu/body))
  :config
  (setq lsp-enable-snippet nil)
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  :hook ((clojure-mode . lsp)
         (clojurec-mode . lsp)
         (clojurescript-mode . lsp))
  :commands lsp)

(use-package lsp-ui :commands lsp-ui-mode)

(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(defhydra lsp-menu (:color blue :hint nil)
  "
Threading                      Code Manip                      Namespace                       Misc
------------------------------------------------------------------------------------------------------------------------------------------------------
_th_: Thread first             _el_: Expand let                _cn_: Clean ns                  _cp_: Cycle privacy
_tf_: Thread first all         _il_: Introduce let             _am_: Add missing libspec       _cc_: Cycle coll
_tt_: Thread last              _ml_: Move to let
_tl_: Thread last all          _ef_: Extract function
_ua_: Unwind all               _rn_: Rename
_uw_: Unwind thread
"

  ("cp" lsp-clojure-cycle-privacy)
  ("cn" lsp-clojure-clean-ns)
  ("cc" lsp-clojure-cycle-coll)
  ("am" lsp-clojure-add-missing-libspec)
  ("el" lsp-clojure-expand-let)
  ("il" lsp-clojure-introduce-let)
  ("ef" lsp-clojure-extract-function)
  ("ml" lsp-clojure-move-to-let)
  ("th" lsp-clojure-thread-first)
  ("rn" lsp-rename)
  ("tf" lsp-clojure-thread-first-all)
  ("tt" lsp-clojure-thread-last)
  ("tl" lsp-clojure-thread-last-all)
  ("ua" lsp-clojure-unwind-all)
  ("uw" lsp-clojure-unwind-thread))

;;; wk-lsp.el ends here
