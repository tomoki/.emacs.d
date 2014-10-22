(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/elmy")

;;init-loader-setting
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")
;;(put 'erase-buffer 'disabled nil)

