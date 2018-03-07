(defun spacelite/init-utils ()
  (spacelite/init-deft)
  (spacelite/init-google-this))

(defun spacelite/init-deft ()
  (use-package deft
    :defer t
    :commands (deft-new-file-named)
    :init
      (setq deft-default-extension "md")
      (spacelite/set-leader-keys
	"n C-n" 'deft-new-file-named
	"nN" 'deft-new-file
	"nn" 'deft-find-file)))

(defun spacelite/init-google-this ()
  (use-package google-this
    :config (google-this-mode 1)
    :diminish 'google-this-mode
    :init (spacelite/set-leader-keys "sg" 'google-this-mode-submap)))



(provide 'spacelite-utils)
