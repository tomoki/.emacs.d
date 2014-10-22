(setq-default c-basic-offset 4)
(setq-default c-indent-level 4)

(require 'flymake-cursor)
;;flymake setting
(require 'flymake)

(add-hook 'c-mode-hook
          '(lambda ()
             (progn
               (flymake-mode t)
               (hs-minor-mode t))))

(add-hook 'c++-mode-hook
          '(lambda ()
             (progn
               (flymake-mode t)
               (hs-minor-mode t))))

;; Makefile が無くてもC/C++のチェック
(defun flymake-simple-generic-init (cmd &optional opts)
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                      'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list cmd (append opts (list local-file)))))

(defun flymake-simple-make-or-generic-init (cmd &optional opts)
  (if (file-exists-p "Makefile")
      (flymake-simple-make-init)
    (flymake-simple-generic-init cmd opts)))

(defun flymake-c-init ()
  (flymake-simple-make-or-generic-init
   "gcc" '("-Wall" "-Wextra" "-Wshadow" "-fsyntax-only")))

(defun flymake-cc-init ()
  (flymake-simple-make-or-generic-init
   "g++" '("-std=c++11" "-Wall" "-Wextra" "-Wshadow" "-fsyntax-only")))

(push '("\\.c\\'" flymake-c-init) flymake-allowed-file-name-masks)
(push '("\\.\\(cc\\|cpp\\|C\\|CPP\\|hpp\\|h\\)\\'" flymake-cc-init)
      flymake-allowed-file-name-masks)


(require 'font-lock)

(font-lock-add-keywords
 'c++-mode
 (list
  (cons (regexp-opt '("alignof" "alignas" "constexpr" "decltype" "noexcept"
                      "nullptr" "static_assert" "thread_local" "override" "final") t)
        font-lock-keyword-face)
  (cons (regexp-opt '("auto") t)
        font-lock-type-face)
  (cons "\\<[\\-+]*[0-9]*\\.?[0-9]+\\([ulUL]+\\|[eE][\\-+]?[0-9]+\\)?\\>"
        font-lock-constant-face)
  (cons "\\<[A-Z]+[A-Z_]+\\>"
        font-lock-constant-face)
  (cons "\\<0[xX][0-9A-Fa-f]+\\>"
        font-lock-constant-face)

  ;; my specific
  (cons (regexp-opt '("repeat") t)
        font-lock-keyword-face)
  )
 )


