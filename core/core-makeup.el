;; Copyright (c) 2017 Hüseyin Zengin
;;
;; Author: Hüseyin Zengin <hzenginx@gmail.com>
;; URL: https://github.com/hzenginx/spacelite
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun spacelite/init-makeup ()
  ;; hide column numbers
  (setq column-number-mode nil)

  ;; always hightlight current line
  (global-hl-line-mode t)

  ;; stop blinking!!
  (blink-cursor-mode 0)

  ;; y or n is enough for me
  (fset 'yes-or-no-p 'y-or-n-p)

  ;; draw underline lower
  (setq x-underline-at-descent-line t)

  ;; hide ui elements
  (setq inhibit-startup-message t)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (toggle-scroll-bar -1)

  ;; font
  (set-face-attribute 'default nil
		      :family config-font-family
		      :height config-font-height)
  (set-frame-parameter nil 'fullscreen 'fullboth)

  (spacelite//init-theme)
  (spacelite//init-spaceline)

  ;; window numbers
  (use-package winum)
  (winum-mode)

  ;; evil-anzu for improving search result rendering
  (use-package
    evil-anzu
    :config (global-anzu-mode +1)
    :diminish 'anzu-mode)

  ;; relative line numbers + centered mode FTW
  (use-package
    linum-relative
    :diminish 'linum-relative-mode
    :init (setq linum-relative-current-symbol "")
    :config (linum-relative-global-mode))
  (use-package
    centered-cursor-mode
    :config (global-centered-cursor-mode)
    :diminish 'centered-cursor-mode)

  ;; parenthesis
  (show-paren-mode 1)
  (use-package
    highlight-parentheses
    :diminish 'highlight-parentheses-mode
    :config (add-hook 'prog-mode-hook #'highlight-parentheses-mode)))

(defun spacelite//init-theme ()
  (use-package
    solarized-theme :config (load-theme 'solarized-dark t))

  ;; face attributes for helm
  (eval-after-load 'helm
    (lambda ()
      (set-face-attribute
        'helm-selection nil :background "#268bd2" :underline nil :foreground "black"))))

(defun spacelite//init-spaceline ()
  (setq-default
   powerline-height 24
   powerline-default-separator 'wave)

  ;; prevent winum to insert windows numbers to mode line
  (setq winum-auto-setup-mode-line nil)
  ;; prevent anzu to matched numbers to mode line
  (setq anzu-cons-mode-line-p nil)

  (use-package spaceline :ensure t)

  (use-package spaceline-config :ensure spaceline
     :config
     (spaceline-helm-mode 1)
     (spaceline-emacs-theme))

  (spaceline-compile "spacelite" '(
				   (buffer-modified)
				   (window-number :seperator "|")
				   (anzu :priority 4)
				   (major-mode)
				   (process :when active)
				   (minor-modes :when active)
				   (version-control :when active)
				   ) '(buffer-position :seperator "|"))
  (setq-default mode-line-format '("%e" (:eval (spaceline-ml-spacelite))))

  )

(provide 'core-makeup)
