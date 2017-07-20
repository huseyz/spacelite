;; Copyright (c) 2017 Hüseyin Zengin
;;
;; Author: Hüseyin Zengin <hzenginx@gmail.com>
;; URL: https://github.com/hzenginx/spacelite
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun spacelite/init-evil-base () 
  (spacelite/init-evil-escape) 
  (spacelite/init-evil-iedit) 
  (use-package 
    evil-surround 
    :config (global-evil-surround-mode 1)))

(defun spacelite/init-evil-escape () 
  (use-package 
    evil-escape 
    :diminish 'evil-escape-mode) 
  (setq-default evil-escape-key-sequence "fd") 
  (evil-escape-mode)
  ;; esc should escape everything possible
  (require 'evil) 
  (define-key evil-normal-state-map [escape] 'keyboard-quit) 
  (define-key evil-visual-state-map [escape] 'keyboard-quit) 
  (define-key minibuffer-local-map [escape] 'abort-recursive-edit) 
  (define-key minibuffer-local-ns-map [escape] 'abort-recursive-edit) 
  (define-key minibuffer-local-completion-map [escape] 'abort-recursive-edit) 
  (define-key minibuffer-local-must-match-map [escape] 'abort-recursive-edit) 
  (define-key minibuffer-local-isearch-map [escape] 'abort-recursive-edit))

(defun spacelite/init-evil-iedit () 
  (use-package 
    evil-iedit-state 
    :defer t 
    :commands (evil-iedit-state evil-iedit-state/iedit-mode) 
    :init (progn 
	    (setq iedit-current-symbol-default t iedit-only-at-symbol-boundaries t
		  iedit-toggle-key-default nil) 
	    (spacelite/set-leader-keys "se" 'evil-iedit-state/iedit-mode)) 
    :config (define-key evil-iedit-state-map (kbd config-leader-key) spacelite-default-map)))

(provide 'spacelite-evil)
