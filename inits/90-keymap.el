;; http://akisute3.hatenablog.com/entry/20120318/1332059326
(keyboard-translate ?\C-h ?\C-?)
;; kill anthy?
(define-key global-map (kbd "C-\\") (lambda () ()))
(define-key global-map (kbd "C-m") 'newline-and-indent)

(require 'flip-or-change-window)
(define-key global-map (kbd "C-t") 'switch-to-last-buffer-or-other-window)
(define-key global-map (kbd "C-x C-b") 'buffer-menu)

(require 'evil-nerd-commenter)
(evilnc-default-hotkeys)

(cua-mode t)
(setq-default cua-enable-cua-keys nil)
(setq-default transient-mark-mode t)
