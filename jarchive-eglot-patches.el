;;; jarchive-eglot-patches --- jarchive-eglot-patches

;;; Commentary:
;;; Temporary fix to make find-definition work for external dependencies        ;;
;;; See: https://lists.gnu.org/archive/html/bug-gnu-emacs/2022-10/msg02118.html ;;
;;; and: https://github.com/joaotavora/eglot/issues/661#issuecomment-1287430939 ;;

;;; Code:

(defun eglot--parse-uri (uri)
  (url-unhex-string
   (url-filename
    (let ((url (url-generic-parse-url uri)))
      (if (string= "jar" (url-type url))
          ;; jar: URIs can contain a nested URI, so we need to parse twice.
          ;; For example, `jar:file:///home/user/some.jar!/path/in/jar'
          (url-generic-parse-url (url-filename url))
        url)))))

(defun eglot--uri-to-path (uri)
  "Convert URI to file path, helped by `eglot--current-server'."
  (when (keywordp uri) (setq uri (substring (symbol-name uri) 1)))
  (let* ((server (eglot-current-server))
         (remote-prefix (and server (eglot--trampish-p server)))
         ;;(retval (url-unhex-string (url-filename (url-generic-parse-url uri))))
         (retval (eglot--parse-uri uri))
         ;; Remove the leading "/" for local MS Windows-style paths.
         (normalized (if (and (not remote-prefix)
                              (eq system-type 'windows-nt)
                              (cl-plusp (length retval)))
                         (substring retval 1)
                       retval)))
    (concat remote-prefix normalized)))

;;; wk-ide.el ends here
