;; Copyright (c) 2017 Hüseyin Zengin
;;
;; Author: Hüseyin Zengin <hzenginx@gmail.com>
;; URL: https://github.com/hzenginx/spacelite
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun spacelite/init-helm () 
  (use-package 
    helm 
    :diminish 'helm-mode) 
  (helm-mode 1) 
  (helm-autoresize-mode 1) 
  (use-package 
    ag) 
  (use-package 
    helm-ag 
    :diminish 'helm-mode) 
  (setq helm-prevent-escaping-from-minibuffer t helm-bookmark-show-location 'bottom
	helm-display-header-line nil helm-split-window-in-side-p t helm-always-two-windows t
	helm-echo-input-in-header-line t helm-imenu-execute-action-at-once-if-one nil
	helm-display-function 'spacelite/display-helm-window) 
  (spacelite/helm-init-keybindings))

(defvar helm-display-buffer-regexp 
  `("*.*helm.**" (display-buffer-in-side-window) 
    (inhibit-same-window . t) 
    (side . ,'bottom) 
    (window-width . 0.6) 
    (window-height . 0.4)))

(defun spacelite/display-helm-window (buffer &optional resume)
  "Display the Helm window always at bottom and full width."
  (let ((display-buffer-alist (list helm-display-buffer-regexp))) 
    (helm-default-display-buffer buffer)))

(defun spacelite/helm-init-keybindings () 
  (spacelite/set-leader-keys "<SPC>" 'helm-M-x "bb" 'helm-buffers-list "ff" 'helm-find-files "ji" 'helm-imenu "ry" 'helm-show-kill-ring)
  ;; tab to provide completation
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) 
  (define-key helm-map (kbd "C-j") 'helm-next-line) 
  (define-key helm-map (kbd "C-k") 'helm-previous-line) 
  (define-key helm-map (kbd "C-h") 'helm-next-source) 
  (define-key helm-map (kbd "C-l") 
    (kbd "RET")) 
  (with-eval-after-load 'helm-files (dolist (keymap (list helm-find-files-map helm-read-file-map)) 
				      (define-key keymap (kbd "C-l")
					'helm-execute-persistent-action) 
				      (define-key keymap (kbd "C-h")
					'helm-find-files-up-one-level))))

(provide 'spacelite-helm)
