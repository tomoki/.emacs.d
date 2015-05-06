(require 'async)

(defun async-save-auto-save ()
  (async-start
   (lambda ()
     (save-buffer))
   'ignore))


(provide 'async-save-auto)
