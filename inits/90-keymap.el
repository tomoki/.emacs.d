;; http://akisute3.hatenablog.com/entry/20120318/1332059326
(keyboard-translate ?\C-h ?\C-?)
;; kill anthy?
(define-key global-map (kbd "C-\\") (lambda () ()))

(define-key global-map (kbd "C-m") 'newline-and-indent)
;; (require 'multiple-cursors)
;; (global-set-key (kbd "C->") 'mc/mark-next-like-this)
;; (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;; (global-set-key (kbd "C-*") 'mc/mark-all-like-this)
