(defun spacelite/init-utils ()
    (spacelite/init-deft))

(defun spacelite/init-deft ()
  (use-package deft :defer t :init
    (progn
      (setq deft-default-extension "md")
      (spacelite/set-leader-keys
	"n C-n" 'deft-new-file-named
	"nN" 'deft-new-file
	"nn" 'deft-find-file))))

(provide 'spacelite-utils)
