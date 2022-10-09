;;; wk-functions --- wk functions

;;; Commentary:

;;; Extra functions

;;; Code:

;; Allow going to next sexp
(defun ca-next-defun ()
  (interactive)
  (end-of-defun 2)
  (beginning-of-defun 1))

;; Allow going to prev sexp
(defun ca-prev-defun ()
  (interactive)
  (beginning-of-defun))

;;; wk-functions.el ends here
