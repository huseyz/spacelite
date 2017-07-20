;; Copyright (c) 2017 Hüseyin Zengin
;;
;; Author: Hüseyin Zengin <hzenginx@gmail.com>
;; URL: https://github.com/hzenginx/spacelite
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun spacelite/init-emacs () 
  (setq initial-major-mode config-scratch-mode) 
  (use-package 
    restart-emacs) 
  (use-package 
    mwim 
    :config (global-set-key (kbd "C-a") 'mwim-beginning-of-code-or-line))

  ;; init undo-tree
  (use-package 
    undo-tree 
    :defer t 
    :diminish 'undo-tree-mode) 
  (setq undo-tree-visualizer-timestamps t) 
  (global-undo-tree-mode)

  ;; init company mode
  (use-package 
    company 
    :diminish 'company-mode) 
  (define-key company-active-map (kbd "C-j") 'company-select-next) 
  (define-key company-active-map (kbd "C-k") 'company-select-previous) 
  (define-key company-active-map (kbd "C-l") 'company-complete-selection) 
  (define-key company-active-map (kbd "<escape>") 'company-abort) 
  (define-key company-active-map [tab] nil) 
  (define-key company-active-map (kbd "TAB") nil)

  ;; init whitespace cleanup for prog modes
  (use-package 
    whitespace-cleanup-mode 
    :defer t 
    :init (add-hook 'prog-mode-hook #'whitespace-cleanup-mode) 
    :diminish 'whitespace-cleanup-mode)

  ;; init expand region
  (use-package 
    expand-region 
    :config (spacelite/set-leader-keys "v" 'er/expand-region))

  ;; init flyspell
  (use-package 
    flyspell 
    :config (add-hook 'prog-mode-hook 'flyspell-prog-mode) 
    :diminish 'flyspell-mode) 
  (use-package 
    flyspell-popup 
    :config (define-key flyspell-mode-map (kbd "C-;") #'flyspell-popup-correct)) 
  (define-key popup-menu-keymap (kbd "C-j") 'popup-next) 
  (define-key popup-menu-keymap (kbd "C-k") 'popup-previous) 
  (define-key popup-menu-keymap (kbd "C-l") 'popup-select)

  ;;init highlight numbers for prog modes
  (use-package 
    highlight-numbers 
    :defer t 
    :init (add-hook 'prog-mode-hook 'highlight-numbers-mode))

  ;; keep backups
  (setq make-backup-files config-keep-backups)
  
  (spacelite/set-leader-keys "qr" 'spacelite/restart-emacs "qq" 'spacelite/prompt-kill-emacs))

(defun spacelite/prompt-kill-emacs () 
  (interactive) 
  (save-some-buffers) 
  (kill-emacs))

(defun spacelite/restart-emacs () 
  (interactive) 
  (restart-emacs))

(provide 'spacelite-emacs)
