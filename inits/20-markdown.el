;; http://jblevins.org/projects/markdown-mode/
(add-hook 'markdown-mode-hook
          '(lambda () (electric-indent-mode 0)))
