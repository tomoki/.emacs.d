(add-hook 'org-mode-hook
          (lambda ()
            (flyspell-mode)))
(setq org-hide-leading-stars t)
(setq org-odd-levels-only t)
;; (setq org-todo-keywords
;;       '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "SOMEDAY(s)")))
