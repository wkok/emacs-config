;;; wk-treesit --- wk treesit

;;; Commentary:

;;; Treesit related config

;;; Code:

;; (setq treesit-extra-load-path '("/usr/local/lib"))
;; Treesit ;; Eglot
(setq treesit-eglot-modes
      '((:ts (bash-mode . bash-ts-mode) :pacman "bash-language-server")
        (:ts (c++-mode . c++-ts-mode) :pacman "ccls")
        (:ts (c-mode . c-ts-mode) :pacman "ccls")
        (:ts (cpp-mode . cpp-ts-mode) :pacman "ccls")
        (:ts (c-sharp-mode . sharp-ts-mode))
        (:ts (cmake-mode . cmake-ts-mode))
        (:ts (css-mode . css-ts-mode) :pacman "vscode-css-languageserver")
        (:ts (dockerfile-mode . dockerfile-ts-mode))
        (:ts (elixir-mode . elixir-ts-mode))
        (:ts (glsl-mode . glsl-ts-mode))
        (:ts (go-mode . go-ts-mode) :pacman "gopls")
        (:ts (heex-mode . heex-ts-mode))
        (:ts (html-mode . html-ts-mode) :pacman "vscode-html-languageserver")
        (:ts (java-mode . java-ts-mode))
        (:ts (javascript-mode . js-ts-mode) :pacman "typescript-language-server")
        (:ts (js-json-mode . json-ts-mode) :pacman "vscode-json-languageserver")
        (:ts (julia-mode . julia-ts-mode))
        (:ts (make-mode . make-ts-mode))
        (:ts (markdown-mode . markdown-ts-mode))
        (:ts (python-mode . python-ts-mode) :pacman "jedi-language-server")
        (:ts (typescript-mode . typescript-ts-mode) :pacman "typescript-language-server")
        (:ts (proto-mode . proto-ts-mode))
        (:ts (ruby-mode . ruby-ts-mode))
        (:ts (rust-mode . rust-ts-mode) :pacman "rust-analyzer")
        (:ts (sql-mode . sql-ts-mode))
        (:ts (toml-mode . toml-ts-mode))
        (:ts (tsx-mode . tsx-ts-mode))
        (:ts (verilog-mode . verilog-ts-mode))
        (:ts (vhdl-mode . vhdl-ts-mode))
        (:ts (wgsl-mode . wgsl-ts-mode))
        (:ts (yaml-mode . yaml-ts-mode) :pacman "yaml-language-server")))
;; Not mature yet:
;; (push '(org-mode . org-ts-mode) major-mode-remap-alist)
;; (push '(perl-mode . perl-ts-mode) major-mode-remap-alist)              ;; cpan Perl::LanguageServer
(require 'treesit)

;; Function to parse the above and make an install command
(if (treesit-available-p)
    (let ((pacman-install-list (list )))
      (dolist (ts-pm treesit-eglot-modes)
        (let ((majmode-remap (plist-get ts-pm :ts))
              (pacman-cmd (plist-get ts-pm :pacman)))
          ;; bind default major-mode to ts-mode
          (push majmode-remap major-mode-remap-alist)
          ;; populate install cmd
          (if pacman-cmd
              (unless (member pacman-cmd pacman-install-list)
                (push pacman-cmd pacman-install-list)))))
      (let ((install-cmd (concat
                          "pacman -S --needed "
                          (--reduce (concat acc " " it) pacman-install-list))))
        (message install-cmd)))
  (user-error "Treesitter not available"))

;;; wk-treesit.el ends here
