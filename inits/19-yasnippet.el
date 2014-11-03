(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/tomoki-snippets"))
(yas-reload-all)
(define-key yas-minor-mode-map (kbd "C-;") 'yas/expand)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map [(tab)] nil)
(add-hook 'prog-mode-hook
          '(lambda ()
             (yas-minor-mode)))
