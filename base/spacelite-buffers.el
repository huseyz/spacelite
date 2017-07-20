;; Copyright (c) 2017 Hüseyin Zengin
;;
;; Author: Hüseyin Zengin <hzenginx@gmail.com>
;; URL: https://github.com/hzenginx/spacelite
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun spacelite/init-buffers () 
  (spacelite/init-buffer-keybindings))

(defun spacelite/init-buffer-keybindings () 
  (spacelite/set-leader-keys "TAB"   'spacelite/alternate-buffer "bd"   'spacelite/kill-this-buffer
    "b C-d" 'spacelite/kill-other-buffers "be"   'spacelite/safe-erase-buffer "bn"    'next-buffer
    "bN"    'spacelite/new-empty-buffer "bp"    'previous-buffer "bY"
    'copy-whole-buffer-to-clipboard "fs"   'save-buffer "fD"   'spacelite/delete-current-buffer-file
    "bR"   'revert-buffer))

(defun spacelite/alternate-buffer 
    (&optional 
     window) 
  (interactive) 
  (let ((current-buffer (window-buffer window)))
    ;; if no window is found in the windows history, `switch-to-buffer' will
    ;; default to calling `other-buffer'.
    (switch-to-buffer (cl-find-if (lambda (buffer) 
				    (not (eq buffer current-buffer))) 
				  (mapcar #'car (window-prev-buffers window))))))


(defun spacelite/safe-erase-buffer () 
  "Prompt before erasing the content of the file." 
  (interactive) 
  (if (y-or-n-p (format "Erase content of buffer %s ? " (current-buffer))) 
      (erase-buffer)))

(defun spacelite/new-empty-buffer () 
  "Create a new buffer called untitled(<n>)" 
  (interactive) 
  (let ((newbuf (generate-new-buffer-name "untitled"))) 
    (switch-to-buffer newbuf)))

(defun spacelite/kill-this-buffer 
    (&optional 
     arg) 
  (interactive "P") 
  (if (window-minibuffer-p) 
      (abort-recursive-edit) 
    (if (equal 
	 '(4)
	 arg) 
	(kill-buffer-and-window) 
      (kill-buffer))))

(defun spacelite/copy-whole-buffer-to-clipboard () 
  (interactive) 
  (clipboard-kill-ring-save (point-min) 
			    (point-max)))

(defun spacelite/delete-current-buffer-file () 
  (interactive) 
  (let ((filename (buffer-file-name)) 
	(buffer (current-buffer)) 
	(name (buffer-name))) 
    (if (not (and filename 
		  (file-exists-p filename))) 
	(ido-kill-buffer) 
      (when (yes-or-no-p "Are you sure you want to delete this file? ") 
	(delete-file filename t) 
	(kill-buffer buffer) 
	(call-interactively #'projectile-invalidate-cache) 
	(message "File '%s' successfully removed" filename)))))

(provide 'spacelite-buffers)
