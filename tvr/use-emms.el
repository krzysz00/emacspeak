;; -*- lexical-binding: nil; -*-
(require 'use-package)
;;; Autoload emms with one entry proint  ---emms-browser --- bound to C-; .
;;; After emms is used the first time, the C-; .  becomes a prefix command.

(use-package emms
  :init (define-prefix-command 'emms-prefix-command  'emms-prefix-map "EMMS")
  :commands  (emms-browser)
  :config
  (global-set-key (kbd "C-; .") 'emms-prefix-command)
  (require 'emms-setup)
  (setq emms-player-list'(emms-player-mplayer-playlist emms-player-mplayer))
  (emms-all)
  (emms-default-players)
  (setq emms-source-file-default-directory "~/mp3")
  :bind (("C-; .".  emms-browser) ("C-x @ h ." . emms-browser)
:map emms-prefix-map 
("b" . emms-browser)
        ("<left>" . emms-seek-backward)
        ("<right>" . ems-seek-forward)
        ("C-b" . emms-seek-backward)
        ("C-f" . emms-seek-forward)
        ("q" . emms-stop)
        ("s" . emms-start)
        ("." . emms-pause)
        ("n" . emms-next)
        ("p" . emms-previous)
        ("S" . emms-shuffle)
        ("d" . emms-play-directory)
        ("D" . emms-play-directory-tree)
        ("l" . emms-locate)
        ("f" . emms-play-find)
        ("g" . emms-playlist-mode-go)
        ("j" . emms-seek)
        ("J" . emms-seek-to)
        ("r" . emms-random)
        ("i" . emms-show)
        (";" . emms-streams)
        ("a" . emms-add-find))
  )