;; 補完時に大文字小文字を区別しない
;; FIXME: It is Emacs bug, but it is sometime buggy.
;; (setq eshell-cmpl-ignore-case t)


(setq eshell-ask-to-save-history (quote always))
(setq eshell-cmpl-cycle-completions t)
(setq eshell-cmpl-cycle-cutoff-length 5)
(setq eshell-hist-ignoredups t)
(setq eshell-banner-message "")
(defun my-clear ()
  (interactive)
  (let (prev-readonly inhibit-read-only)
    (setq inhibit-read-only t)
    (erase-buffer)
    (setq inhibit-read-only prev-readonly))
  (newline))

(add-hook 'eshell-mode-hook
          '(lambda ()
             (progn
               ;; (define-key eshell-mode-map "\C-a" 'eshell-bol)
               ;; (define-key eshell-mode-map "\C-p" 'eshell-previous-matching-input-from-input)
               ;; (define-key eshell-mode-map "\C-n" 'eshell-next-matching-input-from-input)
               (define-key eshell-mode-map "\C-cl" 'my-clear)
               (add-to-list 'eshell-command-aliases-list '("u" "cd .. $*"))
               (add-to-list 'eshell-command-aliases-list '("gpp" "clang++ -std=c++11 -Wall -O2 $*"))
               (add-to-list 'eshell-command-aliases-list '("ls" "ls --color=auto $*"))
               (add-to-list 'eshell-command-aliases-list '("ll" "ls -l $*"))
               (add-to-list 'eshell-command-aliases-list '("la" "ls -a $*"))
               (add-to-list 'eshell-command-aliases-list '("lla" "ls -l -a $*"))
               (add-to-list 'eshell-command-aliases-list '("u" "cd .. $*"))
               (add-to-list 'eshell-command-aliases-list '("uu" "cd ../.. $*"))
               (add-to-list 'eshell-command-aliases-list '("uuu" "cd ../../.. $*"))
               )
             ))

(setq eshell-prompt-function
      (lambda ()
        (concat "[" (user-login-name) "@" (system-name) " " (eshell/pwd) "]"
                (if (= (user-uid) 0) "# " "$ "))))

(setq eshell-prompt-regexp "^[^#$\n]*[#$] ")
