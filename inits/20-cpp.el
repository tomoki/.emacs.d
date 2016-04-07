(setq-default c-basic-offset 4)
(setq-default c-indent-level 4)

(add-hook 'c-mode-hook
          '(lambda ()
             (progn
               (setq flycheck-clang-language-standard "c11")
               (flycheck-mode t)
               (hs-minor-mode t))))

(add-hook 'c++-mode-hook
          '(lambda ()
             (progn
               (setq flycheck-clang-language-standard "c++11")
               (flycheck-mode t)
               (hs-minor-mode t))))

;; (require 'flymake-cursor)
;; ;;flymake setting
;; (require 'flymake)

;; (add-hook 'c-mode-hook
;;           '(lambda ()
;;              (progn
;;                (flymake-mode t)
;;                (hs-minor-mode t))))

;; (add-hook 'c++-mode-hook
;;           '(lambda ()
;;              (progn
;;                (flymake-mode t)
;;                (hs-minor-mode t))))

;; (require 'font-lock)

;; (font-lock-add-keywords
;;  'c++-mode
;;  (list
;;   (cons (regexp-opt '("alignof" "alignas" "constexpr" "decltype" "noexcept"
;;                       "nullptr" "static_assert" "thread_local" "override" "final") t)
;;         font-lock-keyword-face)
;;   (cons (regexp-opt '("auto") t)
;;         font-lock-type-face)
;;   (cons "\\<[\\-+]*[0-9]*\\.?[0-9]+\\([ulUL]+\\|[eE][\\-+]?[0-9]+\\)?\\>"
;;         font-lock-constant-face)
;;   (cons "\\<[A-Z]+[A-Z_]+\\>"
;;         font-lock-constant-face)
;;   (cons "\\<0[xX][0-9A-Fa-f]+\\>"
;;         font-lock-constant-face)

;;   ;; my specific
;;   (cons (regexp-opt '("repeat") t)
;;         font-lock-keyword-face)
;;   )
;;  )
