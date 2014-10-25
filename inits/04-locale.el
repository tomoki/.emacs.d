;;Use utf-8 when it can.
(prefer-coding-system 'utf-8)
(set-language-environment 'Japanese)
(set-locale-environment nil)


(add-to-list 'load-path "~/.emacs.d/elmy/skk")

(require 'skk-autoloads)

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

;; 対応する閉括弧を自動的に挿入する
;; (setq skk-auto-insert-paren t)

;; 動的な補完を使う
;; (setq skk-dcomp-activate t)

;; 動的補完の可否を判定するより高度な設定例
;; (setq skk-dcomp-activate
;;       #'(lambda ()
;;           (and
;;             ;; -nw では動的補完をしない。
;;             window-system
;;             ;; 基本的に行末のときのみ補完する。ただし行末でなくても現在の
;;             ;; ポイントから行末までの文字が空白のみだったら補完する。
;;             (or (eolp)
;;                 (looking-at "[ \t]+$")))))

;; ;; 動的補完で候補を複数表示する
;; (setq skk-dcomp-multiple-activate t)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; @@ 検索に関連した設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 数値変換機能を使う
(setq skk-use-numeric-conversion t)

;; カタカナ語を変換候補に加える。
;; (setq skk-search-prog-list
;;       (skk-nunion skk-search-prog-list
;;                   '((skk-search-katakana))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;辞書に関する設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; 辞書サーバを使うための設定
;; ;;(setq skk-server-host "localhost")
;; (setq skk-server-portnum 1178)

;; ;; 複数の Emacsen を起動して個人辞書を共有する
;; (setq skk-share-private-jisyo t)
;;(setq skk-large-jisyo "~/.emacs.d/skk/dic/SKK-JISYO.L")
(setq skk-large-jisyo "~/.emacs.d/SKK-JISYO.L")

;; 10 分放置すると個人辞書が自動的に保存される設定
(defvar skk-auto-save-jisyo-interval 600)
(defun skk-auto-save-jisyo ()
  (skk-save-jisyo)
  )
(run-with-idle-timer skk-auto-save-jisyo-interval
                     skk-auto-save-jisyo-interval
                     'skk-auto-save-jisyo)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;その他いろいろ
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; かなモードの入力で (モード変更を行なわずに) 長音(ー)を
;; ASCII 数字の直後では `-' に、全角数字の直後では `?' にしたい。
;; (setq skk-rom-kana-rule-list
;;       (cons '("-" nil skk-hyphen)
;;             skk-rom-kana-rule-list))
;; (defun skk-hyphen (arg)
;;   (let ((c (char-before (point))))
;;     (cond ((null c) "ー")
;;           ((and (<= ?0 c) (>= ?9 c)) "-")
;;           ((and (<= ?０ c) (>= ?９ c)) "?")
;;           (t "ー"))))

;; かなモードの入力でモード変更を行わずに、数字入力中の
;; 小数点 (.) およびカンマ (,) 入力を実現する。
;; (例) かなモードのまま 1.23 や 1,234,567 などの記述を行える。
;; period
;; (setq skk-rom-kana-rule-list
;;       (cons '("." nil skk-period)
;;             skk-rom-kana-rule-list))
;; (defun skk-period (arg)
;;   (let ((c (char-before (point))))
;;     (cond ((null c) "。")
;;           ((and (<= ?0 c) (>= ?9 c)) ".")
;;           ((and (<= ?０ c) (>= ?９ c)) "．")
;;           (t "。"))))

;; ;; comma
;; (setq skk-rom-kana-rule-list
;;       (cons '("," nil skk-comma)
;;             skk-rom-kana-rule-list))
;; (defun skk-comma (arg)
;;   (let ((c (char-before (point))))
;;     (cond ((null c) "、")
;;           ((and (<= ?0 c) (>= ?9 c)) ",")
;;           ((and (<= ?０ c) (>= ?９ c)) "，")
;;           (t "、"))))


(require 'skk)

(setq-default skk-kutouten-type 'en)
(setq skk-preload t)
