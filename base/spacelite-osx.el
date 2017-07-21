;; Copyright (c) 2017 Hüseyin Zengin
;;
;; Author: Hüseyin Zengin <hzenginx@gmail.com>
;; URL: https://github.com/hzenginx/spacelite
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun spacelite/init-osx ()
  (setq mac-command-key-is-meta nil)
  (setq mac-command-modifier 'super)
  (global-set-key (kbd "s-c") 'evil-yank)
  (global-set-key (kbd "s-w") 'evil-delete-buffer)
  (global-set-key (kbd "s-v") 'yank)
  (when config-enable-ligatures (mac-auto-operator-composition-mode)))

(provide 'spacelite-osx)
