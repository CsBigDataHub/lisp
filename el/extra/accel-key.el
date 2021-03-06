(defvar accel-key-count 0)

(if (not (boundp 'running-xemacs))
    (defconst running-xemacs nil))

(if running-xemacs
    (progn
      (defalias 'accel-forward-char  'accel-forward-char--internal)
      (defalias 'accel-backward-char 'accel-backward-char--internal))
  (defun accel-forward-char ()
    (interactive)
    (accel-forward-char--internal))
  (defun accel-backward-char ()
    (interactive)
    (accel-backward-char--internal)))

(defun accel-key ()
  (let ((time (current-time)) status)
    (if (eq last-command this-command)
	(let ((interval (+ (* 1000000
			      (- (nth 1 time) (nth 1 accel-key--prev-time)))
			   (- (nth 2 time) (nth 2 accel-key--prev-time)))))
	  (if (< interval 50000)
	      (progn 
		(setq status 'keeping)
		(setq accel-key-count (1+ accel-key-count)))
	    (setq accel-key-count 0)
	    (cond ((and (< interval 150000) 
			(sit-for 0.2)
			(or (eq accel-key--prev-status 'first)
			    (> accel-key--prev-interval 200000))
;			(> (- accel-key--prev-interval interval) 20000)
;			(< accel-key--prev-interval 1000000)
			)
		   (setq status 'double))
		  (t
		   (setq status 'single))))
	  (setq accel-key--prev-interval interval)
	  )
      
      (setq status 'first)
      (setq accel-key-count 0)
      (setq accel-key--prev-interval 0)
      )
    (setq accel-key--prev-time time)
    (setq accel-key--prev-status status) 
    status))

(defun accel-forward-char--internal ()
  (interactive "_")
  (let ((status (accel-key)))
    (cond ((eq status 'keeping)
	   (forward-char (min (+ (/ accel-key-count 10) 2) 4)))
	  ((eq status 'double)
	   (forward-word 1))
	  ((eq status 'single)
	   (forward-char 1))
	  ((eq status 'first)
	   (forward-char 1)))))

(defun accel-backward-char--internal ()
  (interactive "_")
  (let ((status (accel-key)))
    (cond ((eq status 'keeping)
	   (backward-char (min (+ (/ accel-key-count 10) 2) 4)))
	  ((eq status 'double)
	   (backward-word 1))
	  ((eq status 'single)
	   (backward-char 1))
	  ((eq status 'first)
	   (backward-char 1)))))

(global-set-key "\C-f" 'accel-forward-char)
(global-set-key "\C-b" 'accel-backward-char)
