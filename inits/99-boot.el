;; ;; Emacs起動時にEshellを起動
(add-hook 'after-init-hook (lambda()
                             (progn
                               (eshell)
                               ;; (find-file-other-window "~/Dropbox/org/index.org")
                              )))
