(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/elmy")

(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")
