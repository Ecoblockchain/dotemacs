(use-package org
  :bind
  ("C-c a" . org-agenda)
  ("C-c C-+" . org-capture)
  :mode
  ("\\.org$" . org-mode)
  :config
  (require 'org-protocol)
  (setq org-hide-leading-stars t)
  (setq org-tags-column -70)
  (setq org-directory "~/ownCloud/Org")
  (setq org-archive-location "~/ownCloud/Org/GTD-Archiv.org::Von %s")
  (require 'ox-latex)
  (add-to-list 'org-latex-packages-alist '("" "minted"))
  (add-to-list 'org-latex-classes
               '("tuftebook"
                 "\\documentclass{tufte-book}\n
\\usepackage{color}
\\usepackage{amssymb}
\\usepackage{gensymb}
\\usepackage{nicefrac}
\\usepackage{units}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (add-to-list 'org-latex-classes
               '("tuftehandout"
                 "\\documentclass{tufte-handout}
\\usepackage{color}
\\usepackage{amssymb}
\\usepackage{amsmath}
\\usepackage{gensymb}
\\usepackage{nicefrac}
\\usepackage{units}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (setq org-latex-listings 'minted)
  (setq org-latex-pdf-process
      '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
  (require 'ox-beamer)
  (add-hook 'org-mode-hook 'turn-on-auto-fill)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (sh . t)
     (R . t)
     (python . t)
     (js . t)
     (haskell . t)
     (ditaa . t)))
  (setq org-src-fontify-natively t)
  (setq org-src-tab-acts-natively t)
  (setq org-todo-keywords '((sequence "OFFEN(o)" "WARTEN(w@/!)" "|" "ERLEDIGT(e!)")
                            (sequence "|" "STORNIERT(s@!)")
                            (sequence "HABIT" "|" "ERLEDIGT")
                            (sequence "JAHRESTAG" "|" "ERLEDIGT")
                            (sequence "LOVE" "|" "LOVED")
                            (sequence "|" "DELIGIERT (d@/!)")
                            (sequence "KAEFER(k)" "|" "ERSCHLAGEN(a!)")
                            (sequence "PROJEKT(p!)" "PR_FESTGEFAHREN(f)" "|" "PR_ERLEDIGT(i!)" "PR_STORNIERT(r@/!)")
                            (sequence "LISTE(l)" "|")))

  (setq org-todo-keyword-faces
        '(("PROJEKT" . "#529dff")
          ("LISTE" . "#529dff")
          ("WARTEN" . "#de8485")
          ("STORNIERT" . "#999999")
          ("PR_FESTGEFAHREN" . "#999999")))
  
  (setq org-fontify-done-headline t)
  (setq org-log-into-drawer t)
  (setq org-agenda-files (quote ("~/ownCloud/Org/GTD-Eingang.org" "~/ownCloud/Org/GTD-Aktiv.org" "~/ownCloud/Org/GTD-Gewohnheiten.org" "~/ownCloud/Org/GTD-Jahrestage.org")))
  (setq org-agenda-skip-scheduled-if-done t)
  (setq org-agenda-skip-deadline-if-done t)
  (setq org-habit-preceding-days 0)
  (setq org-agenda-window-setup 'current-window)

  (setq org-agenda-custom-commands
        '(("o" agenda "Is' was, Doc?"
           ((org-agenda-tag-filter-preset '("-@daheim" "-@familie"))
            (org-agenda-ndays 3)
            (org-agenda-start-on-weekday nil)
            (org-show-context-detail 'minimal)
            (org-agenda-overriding-header "Is' was, Doc?")))
          ("d" agenda "Daheim so..."
           ((org-agenda-tag-filter-preset '("-@büro" "-@büroleute" "-@campus"))
            (org-agenda-ndays 3)
            (org-agenda-start-on-weekday nil)
            (org-agenda-overriding-header "Daheim so...")))
          )
        )

  (setq org-agenda-category-icon-alist
        '(("Inbox" "~/.emacs.d/img/inbox.png" nil nil :ascent center)
          ("Habits" "~/.emacs.d/img/habits.png" nil nil :ascent center)
          ("Projects" "~/.emacs.d/img/projects.png" nil nil :ascent center)
          ("Anniv" "~/.emacs.d/img/anniv.png" nil nil :ascent center)))

  (setq org-agenda-include-diary t)
  (setq org-default-notes-file (concat org-directory "/GTD-Eingang.org"))
  (setq org-capture-templates
        '(("a" "Aufgabe" entry (file+headline (concat org-directory "/GTD-Eingang.org") "Eingang")
           "** OFFEN %?\n  %i\n")
          ("l" "Aufgabe (mit Link)" entry (file+headline (concat org-directory "/GTD-Eingang.org") "Eingang")
           "** OFFEN %?\n  %i\n  %a")
          ("e" "Lesezeichen" entry (concat org-directory "/Lesezeichen.org")
	   "* %^{prompt|Beschreibung}\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n%^{prompt|Link}\n\n%?" :empty-lines 1)
          ("k" "Käfer" entry (file+headline (concat org-directory "/GTD-Eingang.org") "Eingang")
           "** KAEFER %?\n  %i\n %a")
          ("z" "Zitat" entry (concat org-directory "/Zitate.org")
           "* %?")
          ("m" "Machen" entry (file+headline (concat org-directory "/Machen.org") "Eingang")
           "** %?\n  %i\n")
          ("g" "Geschenkidee" plain (concat org-directory "/Geschenkideen.org")
           "* %?")
          ("p" "Phrase" plain (concat org-directory "/Phrasen.org")
           "\n\n%?\n")
          ("b" "Buch" entry (concat org-directory "~/Buecher.org")
           "* LESEN %?\n  %U\n")
          ("o" "Motto" entry (concat org-directory "/Mottos.org")
           "* %?")
          ("n" "Notiz" entry (concat org-directory "/Notizen.org")
           "\n* %?\n  %U\n")
          ))
  (setq org-refile-targets (quote ((org-agenda-files :todo . "PROJEKT") (org-agenda-files :todo . "LISTE") (org-agenda-files :todo . "PR_FESTGEFAHREN") (org-agenda-files :tag . "eimer"))))
  (setq org-refile-use-cache nil)
  (setq org-stuck-projects (quote ("+LEVEL=2/+PROJEKT-PR_ERLEDIGT-PR_FESTGEFAHREN" ("OFFEN" "KAEFER") nil "")))
  (require 'org-crypt)
  (org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance (quote ("crypt")))
  (setq org-crypt-key nil)
  (setq org-ellipsis "⤵")
  ;; turn on org-bullets-mode for org-files
  (setq org-bullets-bullet-list '(" "))
  (add-hook 'org-mode-hook 'org-bullets-mode)
  )

(provide 'init-org)
