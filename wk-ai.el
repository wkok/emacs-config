;;; wk-ai --- wk ai

;;; Commentary:

;;; AI features adding more capability

;;; Code:

(use-package elysium
  :custom
  ;; Below are the default values
  (elysium-window-size 0.33) ; The elysium buffer will be 1/3 your screen
  (elysium-window-style 'vertical)) ; Can be customized to horizontal

;; (use-package gptel
;;   :custom
;;   (gptel-model "claude-3-5-sonnet-20240620")
;;   :config
;;   (defun read-file-contents (file-path)
;;     "Read the contents of FILE-PATH and return it as a string."
;;     (with-temp-buffer
;;       (insert-file-contents file-path)
;;       (buffer-string)))
;;   (defun gptel-api-key ()
;;     (read-file-contents "~/.secrets/claude_key"))
;;   (setq
;;    gptel-backend (gptel-make-anthropic "Claude"
;;                    :stream t
;;                    :key #'gptel-api-key)))

(use-package smerge-mode
  :ensure nil
  :hook
  (prog-mode . smerge-mode))

;;; wk-ai.el ends here
