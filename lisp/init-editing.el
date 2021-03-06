(defalias 'yes-or-no-p 'y-or-n-p)

;; autoindent newlines
(define-key global-map (kbd "RET") 'newline-and-indent)

;; autoindent pasted code
(setq autopair-global-mode t)

;; autopair things
(setq autopair-autowrap t)

;; autorevert everything
(global-auto-revert-mode)

;; Textmate-style (un)commenting
(defun comment-or-uncomment-line-or-region ()
  "Comments or uncomments the current line or region."
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    )
  )
(global-set-key [(control c) (c)] 'comment-or-uncomment-line-or-region)

;; Ace-Jump
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;; Expand region
(global-set-key (kbd "C-x =") 'er/expand-region)

(show-paren-mode 1)

(set-default 'indent-tabs-mode nil)

;; ido
(require 'ido)
(ido-mode t)
(global-set-key (kbd "C-x f") 'ido-find-file)
(setq ido-case-fold t)
(setq ido-everywhere t)

;; Hippie expand
(dolist (f '(try-expand-line try-expand-list try-complete-file-name-partially))
  (delete f hippie-expand-try-functions-list))
;; Add this back in at the end of the list.
(add-to-list 'hippie-expand-try-functions-list 'try-complete-file-name-partially t)
(global-set-key (kbd "M-/") 'hippie-expand)


(global-auto-complete-mode t)
(setq ac-modes (append ac-modes '(org-mode R-mode))) 
(ac-config-default)
(define-key ac-complete-mode-map [tab] 'ac-expand)
(setq ac-auto-start 2)
(ac-flyspell-workaround)

(global-set-key (kbd "C-c b ,") 'goto-last-change)
(global-set-key (kbd "C-c b .") 'goto-last-change-reverse)

(provide 'init-editing)
