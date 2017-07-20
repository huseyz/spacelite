;; Copyright (c) 2017 Hüseyin Zengin
;;
;; Author: Hüseyin Zengin <hzenginx@gmail.com>
;; URL: https://github.com/hzenginx/spacelite
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun spacelite/init-git ()
  (use-package
    magit
    :diminish 'auto-revert-mode
    :defer t)
  (spacelite/set-leader-keys "gb" 'magit-blame "gm" 'magit-dispatch-popup)
  (setq auto-revert-buffer-list-filter 'magit-auto-revert-repository-buffers-p)
  (custom-set-variables '(with-editor-emacsclient-executable "/usr/local/bin/emacsclient"))
  (use-package
    evil-magit
    :defer t))

(provide 'spacelite-git)
