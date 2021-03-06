;;; writer-theme-dark.el --- A color theme for Emacs inspired by iA Writer.

;; Original Emacs 23 color-theme by me, ported to Emacs 24 deftheme by
;; Andreas Friesen, patched by me.

(deftheme writer-dark
  "Dark color theme inspired by iA Writer.")

(defvar paper       "#3b3b3b")
(defvar paper-hl    "#2f2f2f")
(defvar base1       "#f5f5f5")
(defvar base2       "#e8e8e8")
(defvar lightblue1  "#529dff")
(defvar lightblue2  "#8bbdff")
(defvar grey1       "#999999")
(defvar green1      "#517d4f")
(defvar green2      "#829056")
(defvar red1        "#d35c5e")
(defvar red2        "#de8485")
(defvar blue1       "#4073b6")
(defvar blue2       "#325178")

(custom-theme-set-faces
 'writer-dark
 
 ;; basic
 `(default ((t (:foreground ,base1 :background ,paper))))
 `(italic ((t (:foreground ,base1 :italic t :underline nil))))
 `(cursor ((t (:foreground ,paper :background ,lightblue1 :inverse-video t))))
 `(fringe ((t (:foreground ,paper :background ,paper))))
 `(highlight ((t (:foreground ,base1 :background ,lightblue2 :inverse-video t))))
 `(isearch ((t (:foreground ,lightblue2 :inverse-video t))))
 `(menu ((t (:foreground ,base1 :background ,paper))))
 `(minibuffer-prompt ((t (:foreground ,blue1))))
 `(mode-line
   ((t (:foreground ,paper :background ,grey1
		    :box (:line-width 1 :color ,grey1)))))
 `(mode-line-buffer-id ((t (:foreground ,base1))))
 `(mode-line-inactive
   ((t (:foreground ,grey1  :background ,paper
		    :box (:line-width 1 :color ,grey1)))))
 `(region ((t (:background ,lightblue2))))
 `(secondary-selection ((t (:background ,paper :inverse-video: t))))
 `(vertical-border ((t (:foreground ,grey1))))

 ;; h-line-mode
 `(hl-line ((t (:background ,paper-hl))))

 ;; paren-match
 `(show-paren-match-face ((t (:background ,blue1))))
 `(show-paren-mismatch-face ((t (:background ,red1))))

 ;; font-lock-faces
 `(font-lock-comment-face ((t (:foreground ,grey1 :italic t))))
 `(font-lock-constant-face ((t (:foreground ,lightblue1))))
 `(font-lock-function-name-face ((t (:foreground ,lightblue2))))
 `(font-lock-keyword-face ((t (:foreground ,red1))))
 `(font-lock-type-face ((t (:foreground ,red2))))
 `(font-lock-my-functions-face ((t (:foreground ,lightblue2))))
 `(font-lock-string-face ((t (:foreground ,blue1))))
 `(font-lock-fixme-face ((t (:foreground ,red1 :underline ,red1 :bold t))))
 `(font-lock-builtin-face ((t (:foreground ,lightblue2))))
 `(button ((t (:foreground ,lightblue1 :underline ,lightblue1))))

 ;; auto-complete
 `(ac-selection-face ((t (:foreground ,paper :background ,lightblue2))))
 `(ac-candidate-face ((t (:foreground ,grey1 :background ,paper))))

 ;; Flyspell
 `(flyspell-incorrect ((t (:inherit nil :foreground ,grey1 :background ,paper :underline ,red1))))
 `(flyspell-duplicate ((t (:inherit nil :foreground ,grey1 :background ,paper :underline ,grey1))))

 ;; org
 `(org-hide ((t (:foreground ,paper :background ,paper))))
 `(org-document-title ((t (:foreground ,lightblue1 :bold t :height 1.1 :underline nil))))
 `(org-document-info ((t (:foreground ,base1 :bold nil :height 1.0 :underline nil))))
 `(org-link ((t (:foreground ,lightblue1 :underline t))))
 `(org-code ((t (:foreground ,grey1))))
 `(org-headline-done ((t (:strike-through t :foreground ,grey1))))
 `(org-special-keyword ((t (:foreground ,grey1))))
 `(org-date ((t (:foreground ,blue1))))
 `(org-level-1 ((t (:foreground ,base2 :bold nil :height 1.3 :underline nil))))
 `(org-level-2 ((t (:foreground ,base2 :bold nil :height 1.2 :underline nil))))
 `(org-level-3 ((t (:foreground ,base2 :bold nil :height 1.1 :underline nil))))
 `(org-level-4 ((t (:foreground ,base2 :bold nil :height 1.1 :underline nil))))
 `(org-level-5 ((t (:foreground ,base2 :bold nil :height 1.1 :underline nil))))
 `(org-level-6 ((t (:foreground ,base2 :bold nil :height 1.1 :underline nil))))
 `(org-todo ((t (:foreground ,red1))))
 `(org-done ((t (:foreground ,grey1))))
 `(org-todo-kwd-face ((t (:foreground ,red1))))
 `(org-done-kwd-face ((t (:foreground ,grey1))))
 `(org-cancelled-kwd-face ((t (:foreground ,grey1))))
 `(org-waiting-kwd-face ((t (:foreground ,red2))))
 `(org-started-kwd-face ((t (:foreground ,red2))))
 `(org-tag ((t (:inherit nil :foreground ,blue1 :inherit nil))))
 `(org-project-todo-kwd-face ((t (:foreground ,lightblue1 :inherit nil))))
 `(org-project-onhold-kwd-face ((t (:foreground ,grey1))))
 `(org-project-scheduled-kwd-face ((t (:foreground ,grey1))))
 `(org-agenda-structure ((t (:foreground ,base1))))
 `(org-agenda-date-today ((t (:foreground ,base1 :bold t :italic t))))
 `(org-agenda-date ((t (:foreground ,base1))))
 `(org-scheduled ((t (:foreground ,grey1))))
 `(org-scheduled-previously ((t (:foreground ,red1))))
 `(org-scheduled-today ((t (:foreground ,lightblue1))))
 `(org-upcoming-deadline ((t (:foreground ,red1))))
 `(org-warning ((t (:foreground ,red1 :bold t))))
 `(org-time-grid ((t (:foreground ,grey1))))
 `(org-agenda-diary ((t (:foreground ,base1 :italic t))))

 ;; dired
 `(dired-directory ((t (:foreground ,lightblue1 :bold t))))

 ;; deft
 `(deft-title-face ((t (:inherit nil :foreground ,lightblue1 :bold t))))
 `(deft-summary-face ((t (:inherit nil :foreground ,base1 :italic t))))
 `(deft-time-face ((t (:inherit nil :foreground ,base2 ))))
 `(deft-header-face ((t (:inherit nil :foreground ,lightblue1 :bold t))))
 `(deft-filter-string-face ((t (:inherit nil :foreground ,base1))))

 ;; eshell
 `(eshell-prompt ((t (:foreground ,lightblue2))))
 )

(provide-theme 'writer-dark)
