;; Copyright (c) 2017 Hüseyin Zengin
;;
;; Author: Hüseyin Zengin <hzenginx@gmail.com>
;; URL: https://github.com/hzenginx/spacelite
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(require 'spacelite-evil)
(require 'spacelite-buffers)
(require 'spacelite-windows)
(require 'spacelite-helm)
(require 'spacelite-projectile)
(require 'spacelite-emacs)
(require 'spacelite-git)
(require 'spacelite-osx)

(defun spacelite/init-base ()
  (spacelite/init-evil-base)
  (spacelite/init-buffers)
  (spacelite/init-windows)
  (spacelite/init-helm)
  (spacelite/init-projectile)
  (spacelite/init-emacs)
  (spacelite/init-git)
  (when (eq system-type 'darwin)
    (spacelite/init-osx)))

(provide 'spacelite-base)
