;;Use utf-8 when it can.
(prefer-coding-system 'utf-8)
(set-language-environment 'Japanese)
(set-locale-environment nil)

;; (require 'skk-autoloads)

;;shift spaceでskk-mode
(global-set-key "\C-x\C-j" 'skk-mode)
;; (define-key global-map (kbd "S-SPC") 'skk-mode)

;;;;チュートリアルの場所設定
;;(setq skk-tut-file "~/.emacs.d/skk/data/SKK.tut")

;; メッセージを日本語で通知する
(setq skk-japanese-message-and-error t)

;; メニューを英語で表示する
(setq skk-show-japanese-menu t)

;isearch-mode に入った際に自動的に skk-isearch を起動
(add-hook 'isearch-mode-hook 'skk-isearch-mode-setup)
(add-hook 'isearch-mode-end-hook 'skk-isearch-mode-cleanup)

;; 変換候補一覧と注釈 (annotation) を GUI ぽく表示する
;; (setq skk-show-tooltip t)

;; ;;tooltipの色設定
;; (when skk-show-tooltip
;;   (setq skk-tooltip-parameters
;;         '((background-color . "ForestGreen")
;;           (border-color . "royal blue")))
;;   )

;; 変換候補をインラインに表示する
(setq skk-show-inline t)

;; 変換候補を縦型インラインに表示する
(setq skk-show-inline 'vertical)

(when skk-show-inline
  ;; 変数 skk-treat-candidate-appearance-function を利用して自前で候補に
  ;; 色を付ける場合はこの変数を nil に設定する。
  (setq skk-inline-show-face nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;基本的なユーザ・インターフェース
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Enter キーを押したときには確定する
(setq skk-egg-like-newline t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;変換動作の調整
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 送り仮名が厳密に正しい候補を優先して表示する
(setq skk-henkan-strict-okuri-precedence t)

;; 辞書登録のとき、余計な送り仮名を送らないようにする
(setq skk-check-okurigana-on-touroku 'auto)

;; 変換の学習
(require 'skk-study)

;;単漢字検索のキーを!にする
(setq skk-tankan-search-key ?!)

;; 数値変換機能を使う
(setq skk-use-numeric-conversion t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;辞書に関する設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq skk-large-jisyo "~/.emacs.d/SKK-JISYO.L")

(defvar skk-auto-save-jisyo-interval 600)
(defun skk-auto-save-jisyo ()
  (skk-save-jisyo)
  )
(run-with-idle-timer skk-auto-save-jisyo-interval
                     skk-auto-save-jisyo-interval
                     'skk-auto-save-jisyo)


(require 'skk)

(setq-default skk-kutouten-type 'en)
(setq skk-preload t)
