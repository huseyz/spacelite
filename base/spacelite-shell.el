;; Copyright (c) 2017 Hüseyin Zengin
;;
;; Author: Hüseyin Zengin <hzenginx@gmail.com>
;; URL: https://github.com/hzenginx/spacelite
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun spacelite/init-shell ()
  (spacelite//init-eshell)
  (spacelite//init-shellpop))

(defun spacelite//eshell-auto-end ()
  (when (and (eq major-mode 'eshell-mode)
	     ;; Not on last line, we might want to edit within it.
	     (not (eq (line-end-position) (point-max))))
    (end-of-buffer)))

(defun spacelite//readonly-eshell ()
  (let ((end eshell-last-output-end))
    (save-excursion
      (goto-char end)
      (end-of-line 0)
      (setq end (point)))
    (when (< eshell-last-output-block-begin end)
      (put-text-property eshell-last-output-block-begin end 'read-only "Read-only interactive eshell output"))))

(defun spacelite//make-eshell-readonly ()
  (add-hook 'eshell-output-filter-functions 'spacelite//readonly-eshell 'append))

(defun spacelite//protect-eshell-prompt ()
  (let ((inhibit-field-text-motion t))
    (add-text-properties
     (point-at-bol)
     (point)
     '(rear-nonsticky t
		      inhibit-line-move-field-capture t
		      field output
		      read-only t
		      front-sticky (field inhibit-line-move-field-capture)))))

(defun spacelite/projectile-shell-pop ()
  (interactive)
  (let ((default-directory (projectile-project-root)))
    (call-interactively 'shell-pop)))

(defun spacelite//init-eshell ()
  (use-package eshell :defer t
    :init (progn
	    (setq eshell-cmpl-cycle-completions nil
	    eshell-buffer-maximum-lines 20000
	    eshell-history-size 350
	    eshell-hist-ignoredups t
	    eshell-buffer-shorthand t
	    eshell-highlight-prompt nil
	    eshell-plain-echo-behavior t
	    eshell-directory-name (concat user-emacs-directory ".cache/eshell/"))))
  (use-package eshell-prompt-extras :defer t)
  (use-package eshell-z :defer t)
  (add-hook 'evil-insert-state-entry-hook 'spacelite//eshell-auto-end)
  (add-hook 'eshell-after-prompt-hook 'spacelite//protect-eshell-prompt)
  (add-hook 'eshell-mode-hook 'spacelite//make-eshell-readonly))

(defun spacelite//init-shellpop ()
  (use-package shell-pop
    :defer t
    :init
    (progn
      (setq
       shell-pop-window-position 'bottom
       shell-pop-window-size 30
       shell-pop-term-shell shell-file-name
       shell-pop-shell-type (quote ("eshell" "*eshell*" (lambda nil (eshell))))
       shell-pop-full-span t)
      (spacelite/set-leader-keys "p'" 'spacelite/projectile-shell-pop)
      )))

(provide 'spacelite-shell)
