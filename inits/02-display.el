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

(defconst default-font-size 120)
(defconst big-font-size (round (* default-font-size 1.5)))

(defun config-font-size (size)
  (interactive "nInput font size: s")
  (progn
    (set-frame-font "Migu 1M")
    (set-face-attribute 'default nil :height size :weight 'normal :slant 'normal)
    (set-face-attribute 'fixed-pitch nil :height size :weight 'normal :slant 'normal)
    ;; (set-frame-parameter nil 'alpha 80)
    (set-fontset-font (frame-parameter nil 'font)
                      'japanese-jisx0208
                      '("Migu 1M" . "unicode-bmp"))))

(defun config-default-font-size ()
  (interactive)
  (config-font-size default-font-size))
(defun config-big-font-size ()
  (interactive)
  (config-font-size big-font-size))

(defun get-attribute (lst sym)
  (let ((filter (lambda (condp)
                  (delq nil
                        (mapcar (lambda (x) (and (funcall condp x) x)) lst)))))
    (cdr (car (funcall filter (lambda (x) (eq (car x) sym)))))))

;; calc using width
(defun calc-dpi (workspace physical-size)
  (let ((dots-in-one-line (max (nth 2 workspace) (nth 3 workspace)))
        (width-in-inch    (/ (max (nth 0 physical-size) (nth 1 physical-size)) 25.4)))
    (/ dots-in-one-line width-in-inch)))
(defun get-current-dpi ()
  (let ((current-window (frame-monitor-attributes)))
    (calc-dpi (get-attribute current-window 'workarea) (get-attribute current-window 'mm-size))))

(defun adjust-font-size ()
  (interactive)
  (if (> (get-current-dpi) 160)
      (config-big-font-size)
    (config-default-font-size)))

(when window-system
  (adjust-font-size))
