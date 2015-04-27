(require 'region-bindings-mode)
(region-bindings-mode-enable)

(define-key region-bindings-mode-map (kbd "a") 'mc/mark-all-like-this)
(define-key region-bindings-mode-map (kbd "e") 'mc/edit-lines)
(define-key region-bindings-mode-map (kbd "p") 'mc/mark-previous-like-this)
(define-key region-bindings-mode-map (kbd "n") 'mc/mark-next-like-this)
(define-key region-bindings-mode-map (kbd "u") 'mc/remove-current-cursor)
(define-key region-bindings-mode-map (kbd "s") 'mc/skip-to-next-like-this)
(define-key region-bindings-mode-map (kbd "S") 'mc/skip-to-previous-like-this)

(setq-default cua-enable-cua-keys nil)
(setq-default transient-mark-mode t)
