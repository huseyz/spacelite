;; Copyright (c) 2017 Hüseyin Zengin
;;
;; Author: Hüseyin Zengin <hzenginx@gmail.com>
;; URL: https://github.com/hzenginx/spacelite
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(require 'spacelite-scala)
(require 'spacelite-markdown)

(defun spacelite/init-langs ()
  (spacelite/init-scala)
  (spacelite/init-markdown))

(provide 'spacelite-langs)
