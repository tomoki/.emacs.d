(column-number-mode t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar nil)

(setq-default show-trailing-whitespace t)

(show-paren-mode 1)
(setq-default show-paren-delay 0)

(fringe-mode (cons nil 0))


(load-theme 'zenburn t)

(require 'whitespace)
;; make whitespace-mode use just basic coloring
(set-face-foreground 'whitespace-tab "gray40")
(setq whitespace-style (quote (tabs tab-mark)))
(global-whitespace-mode 1)
(setq whitespace-display-mappings
      ;; all numbers are Unicode codepoint in decimal. try (insert-char 182 ) to see it
      '(
        (tab-mark 9 [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
        ))

(setq font-lock-maximum-decoration t)
;;if windowsystem,config font.
(when window-system
  (progn
    (set-frame-font "Migu 1M")
    (set-face-attribute 'default nil :height 100 :weight 'normal :slant 'normal)
    (set-face-attribute 'fixed-pitch nil :height 100 :weight 'normal :slant 'normal)
    ;; (set-frame-parameter nil 'alpha 80)
    (set-fontset-font (frame-parameter nil 'font)
                      'japanese-jisx0208
                      '("Migu 1M" . "unicode-bmp"))))
