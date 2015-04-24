(setq ispell-program-name "aspell")
(setq ispell-list-command "--list")
(setq flyspell-issue-message-flag nil)

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda ()
                   (flyspell-mode 1)
                   (flyspell-buffer))))

(add-hook 'prog-mode-hook
  (lambda () (flyspell-prog-mode)))



