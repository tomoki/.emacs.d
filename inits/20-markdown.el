;; http://jblevins.org/projects/markdown-mode/
(add-hook 'markdown-mode-hook
          '(lambda () (electric-indent-mode 0)))

;; https://www.yewton.net/2016/01/20/markdown-mode-skk-kakutei/
(defun my--markdown-entery-key-ad (this-func &rest args)
  "markdown-modeでskk-henkan-mode中にエンターすると行頭にカーソルが飛んでしまう問題の対応"
  (if skk-henkan-mode (skk-kakutei)
    (apply this-func args)))
(advice-add #'markdown-enter-key :around #'my--markdown-entery-key-ad)
