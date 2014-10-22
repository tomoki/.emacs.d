
(define-key global-map (kbd "C-x C-b") 'buffer-menu)

(require 'cycle-buffer)
(define-key global-map (kbd "C-t") 'switch-to-last-buffer-or-other-window)

;;; last-buffer
(defvar last-buffer-saved nil)
;; last-bufferで選択しないバッファを設定
(defvar last-buffer-exclude-name-regexp
  (rx (or "*init log*" "*Completions*" "*quickrun*"
          (regexp "^ "))))

(defun record-last-buffer ()
  (when (and (one-window-p)
             (not (eq (window-buffer) (car last-buffer-saved)))
             (not (string-match last-buffer-exclude-name-regexp
                                (buffer-name (window-buffer)))))
    (setq last-buffer-saved
          (cons (window-buffer) (car last-buffer-saved)))))
(add-hook 'window-configuration-change-hook 'record-last-buffer)

(defun switch-to-last-buffer ()
  (interactive)
  (condition-case nil
      (switch-to-buffer (cdr last-buffer-saved))
    (error (switch-to-buffer (other-buffer)))))

(defun switch-to-last-buffer-or-other-window ()
  (interactive)
  (if (one-window-p t)
      (switch-to-last-buffer)
    (other-window 1)))
