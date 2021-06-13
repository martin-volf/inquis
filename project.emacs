(custom-set-variables
  '(org-journal-dir "~/Documents/AK/calix/tma/journal/")
  )

(defun summ-export ()
  (interactive)
  (with-temp-buffer
    (org-mode)
    (save-some-buffers)

    (loop for jfile in
          (sort (directory-files "~/Documents/AK/calix/tma/journal/" t "^[0-9]+$")
                #'string-greaterp)
          do (insert-file jfile))

    (end-of-buffer)
    (insert "\n#+EXPORT_FILE_NAME: /tmp/summ\n")
    (org-html-export-to-html)))
