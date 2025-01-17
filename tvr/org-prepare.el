;;;$Id: org-prepare.el 6727 2011-01-14 23:22:20Z tv.raman.tv $  -*- lexical-binding: nil; -*-

(with-eval-after-load "org"
  (require 'org-tempo)
  (add-hook 'org-mode-hook #'turn-on-org-cdlatex)
  (require 'ol-eww)
  (require 'ox-md)
  

  (define-prefix-command 'org-multi-keymap)
  (define-key org-mode-map (ems-kbd "C-'") 'org-multi-keymap)
  (define-key org-multi-keymap "n" #'org-next-link)
  (define-key org-multi-keymap "'" #'org-open-at-point)
  (define-key org-multi-keymap ";" #'emacspeak-org-amarks-play)
  (define-key org-multi-keymap "p" #'org-previous-link)
  (define-key org-mode-map (ems-kbd "C-,") 'emacspeak-alt-keymap)
  (define-key org-mode-map (ems-kbd "C-c m") 'org-md-export-as-markdown)
  (define-key global-map (ems-kbd "C-c i") 'org-insert-link)
  (define-key global-map (ems-kbd "C-c l") 'org-store-link)
  (define-key global-map (ems-kbd "C-c b") 'org-switchb)
  (define-key global-map  (ems-kbd "C-c c") 'org-capture)
  )
(with-eval-after-load "orgalist"
  (diminish 'orgalist-mode ""))
