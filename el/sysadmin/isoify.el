;translating text for the fax modem
(defun isoify-letter-draft ()
  (interactive)
  (set-window-point (selected-window) 0)
  (search-forward "--------")
  (isoify-region (point) (point-max)))

(defun isoify-buffer ()
  (interactive)
  (isoify-region (point-min) (point-max)))

(defun isoify-region (start stop)
  (interactive "r")
  (save-excursion
    (goto-char start)
    (while (search-forward "{" stop t)
      (replace-match "�" nil t)))
  (save-excursion
    (goto-char start)
    (while (search-forward "}" stop t)
      (replace-match "�" nil t)))
  (save-excursion
    (goto-char start)
    (while (search-forward "|" stop t)
      (replace-match "�" nil t)))
  (save-excursion
    (goto-char start)
    (while (search-forward "[" stop t)
      (replace-match "�" nil t)))
  (save-excursion
    (goto-char start)
    (while (search-forward "]" stop t)
      (replace-match "�" nil t)))
  (save-excursion
    (goto-char start)
    (while (search-forward "\\" stop t)
      (replace-match "�" nil t))))

;undo function for the above
(defun unisoify-letter-draft ()
  (interactive)
  (set-window-point (selected-window) 0)
  (search-forward "--------")
  (unisoify-region (point) (point-max)))

(defun unisoify-buffer ()
  (interactive)
  (unisoify-region (point-min) (point-max)))

(defun unisoify-region (start stop)
  (interactive "r")
  (save-excursion
    (goto-char start)
    (while (search-forward "�" stop t)
      (replace-match "{" nil t)))
  (save-excursion
    (goto-char start)
    (while (search-forward "�" stop t)
      (replace-match "}" nil t)))
  (save-excursion
    (goto-char start)
    (while (search-forward "�" stop t)
      (replace-match "|" nil t)))
  (save-excursion
    (goto-char start)
    (while (search-forward "�" stop t)
      (replace-match "[" nil t)))
  (save-excursion
    (goto-char start)
    (while (search-forward "�" stop t)
      (replace-match "]" nil t)))
  (save-excursion
    (goto-char start)
    (while (search-forward "�" stop t)
      (replace-match "\\" nil t))))

(defun isoify-lyskom-edit-buffer ()
  (interactive)
  (save-excursion
    (save-restriction
      (goto-char (point-min))
;;      (search-forward "--- Skriv nedan. Skicka in=M-x kom-edit-send, Avbryt=C-c C-k, Annat se C-h m ---")
      (search-forward "�rende: ")
      (narrow-to-region (point) (point-max))
      (isoify-buffer))))

(defun unisoify-lyskom-edit-buffer ()
  (interactive)
  (save-excursion
    (save-restriction
      (goto-char (point-min))
;;      (search-forward "--- Skriv nedan. Skicka in=M-x kom-edit-send, Avbryt=C-c C-k, Annat se C-h m ---")
      (search-forward "�rende: ")
      (narrow-to-region (point) (point-max))
      (unisoify-buffer))))
