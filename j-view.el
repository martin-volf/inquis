(require 'calendar)

(defun journal-view ()
  (interactive)
  (setq org-journal-dir "/home/martin/Documents/AK/calix/tma/journal/")
  (switch-to-buffer (get-buffer-create calendar-buffer))
  (calendar-generate-window 5 1450)
  (calendar-mode))
