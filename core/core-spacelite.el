;; Copyright (c) 2017 Hüseyin Zengin
;;
;; Author: Hüseyin Zengin <hzenginx@gmail.com>
;; URL: https://github.com/hzenginx/spacelite
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(require 'core-config)
(require 'core-keybindings)
(require 'core-makeup)

(defun spacelite/init ()
  (spacelite/init-use-package)
  (spacelite/init-diminish)
  (spacelite/init-bind-map)
  (spacelite/init-evil)
  (spacelite/init-which-key)
  (spacelite/init-makeup))

(defun spacelite/init-diminish ()
  (use-package
    diminish))

(defun spacelite/init-use-package ()
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package)))

(defun spacelite/init-bind-map ()
  (use-package
    bind-map)
  (require 'bind-map)
  (bind-map spacelite-default-map
    :prefix-cmd spacelite-cmds
    :evil-keys (config-command-key)
    :override-minor-modes t
    :override-mode-name spacelite-leader-override-mode))

(defun spacelite/init-evil ()
  (use-package
    evil)
  (require 'evil)
  (evil-mode 1))

(defun spacelite/init-which-key ()
  (use-package
    which-key
    :defer t
    :diminish which-key-mode)
  (which-key-mode)
  (setq which-key-idle-delay config-which-key-delay)
  (let ((new-descriptions '(("spacelite//*\\(.+\\)" . "\\1"))))
    (dolist (nd new-descriptions)
      (push (cons (cons nil (concat "\\`" (car nd) "\\'"))
		  (cons nil (cdr nd))) which-key-replacement-alist)))
  (spacelite/init-which-key--default-prefixes))

(defun spacelite/init-which-key--default-prefixes ()
  (setq prefixes '(("f" "file")
		   ("s" "search")
		   ("b" "buffer")
		   ("p" "projectile")
		   ("pb" "buffers")
		   ("q" "quit")
		   ("g" "git")
		   ("j" "jump")
		   ("w" "window")
		   ("n" "note")))
  (mapc (lambda (x)
	  (apply #'spacelite/declare-prefix x)) prefixes))


(provide 'core-spacelite)
