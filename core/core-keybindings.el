;; Copyright (c) 2017 Hüseyin Zengin
;;
;; Author: Hüseyin Zengin <hzenginx@gmail.com>
;; URL: https://github.com/hzenginx/spacelite
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar spacelite-default-map (make-sparse-keymap) 
  "Base keymap for all spacelite leader key commands.")

(defvar spacelite/prefix-titles nil 
  "alist for mapping command prefixes to long names.")

(defun spacelite/declare-prefix (prefix name &optional long-name) 
  (let* ((command name) 
	 (full-prefix (concat config-leader-key " " prefix)))
    ;; define the prefix command only if it does not already exist
    (unless long-name 
      (setq long-name name)) 
    (which-key-declare-prefixes full-prefix (cons name long-name))))

(put 'spacelite/declare-prefix 'lisp-indent-function 'defun)

(defun spacelite/declare-prefix-for-mode (mode prefix name &optional long-name) 
  (let  ((command (intern (concat (symbol-name mode) name))) 
	 (full-prefix (concat config-leader-key " " prefix)) 
	 (is-major-mode-prefix (string-prefix-p "m" prefix)) 
	 (major-mode-prefix (concat config-major-mode-leader-key " " (substring prefix 1)))) 
    (unless long-name 
      (setq long-name name)) 
    (let ((prefix-name (cons name long-name))) 
      (which-key-declare-prefixes-for-mode mode full-prefix prefix-name) 
      (when (and is-major-mode-prefix 
		 config-major-mode-leader-key) 
	(which-key-declare-prefixes-for-mode mode major-mode-prefix prefix-name)))))

(put 'spacelite/declare-prefix-for-mode 'lisp-indent-function 'defun)

(defun spacelite/set-leader-keys (key def &rest bindings) 
  (while key (define-key spacelite-default-map (kbd key) def) 
	 (setq key (pop bindings) def (pop bindings))))

(put 'spacelite/set-leader-keys 'lisp-indent-function 'defun)

(defalias 'evil-leader/set-key 'spacelite/set-leader-keys)

(defun spacelite//init-leader-mode-map (mode map &optional minor) 
  (let* ((prefix (intern (format "%s-prefix" map))) 
	 (leader1 ",") 
	 (leader2 "SPC m") 
	 (leaders (delq nil (list leader1 leader2)))) 
    (or (boundp prefix) 
	(progn (eval `(bind-map ,map 
			:prefix-cmd ,prefix ,(if minor 

						 :minor-modes 
					       :major-modes) 
			(,mode) 
			:evil-keys ,leaders 
			:evil-states (normal motion visual evilified))) 
	       (boundp prefix)))))

(defun spacelite/set-leader-keys-for-major-mode (mode key def &rest bindings) 
  (let* ((map (intern (format "spacelite-%s-map" mode)))) 
    (when (spacelite//init-leader-mode-map mode map) 
      (while key (define-key (symbol-value map) 
		   (kbd key) def) 
	     (setq key (pop bindings) def (pop bindings))))))

(put 'spacelite/set-leader-keys-for-major-mode 'lisp-indent-function 'defun)

(defalias 'evil-leader/set-key-for-mode 'spacelite/set-leader-keys-for-major-mode)

(provide 'core-keybindings)
