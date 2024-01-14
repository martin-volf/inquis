(custom-set-variables
  '(org-journal-dir "~/Documents/AK/calix/tma/journal/")
  )

(require 'calendar)

(defun journal-view ()
  (interactive)
  (switch-to-buffer (get-buffer-create calendar-buffer))
  (calendar-generate-window 5 1450)
  (calendar-mode))

(defun summ-export ()
  (interactive)
  (save-some-buffers)
  (with-temp-buffer
    (org-mode)

    (loop for jfile in
          (sort (directory-files "~/Documents/AK/calix/tma/journal/" t "^[0-9]+$")
                #'string-greaterp)
          do (insert-file jfile))

    (end-of-buffer)
    (insert "\n#+EXPORT_FILE_NAME: /tmp/summ\n")
    (org-html-export-to-html)))

(setq dark-theme t)
