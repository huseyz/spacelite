;; Copyright (c) 2017 Hüseyin Zengin
;;
;; Author: Hüseyin Zengin <hzenginx@gmail.com>
;; URL: https://github.com/hzenginx/spacelite
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun spacelite/init-scala ()
  (use-package
    ensime
    :defer t
    :diminish 'yas-minor-mode)
  (use-package
    sbt-mode
    :defer t)
  (use-package
    scala-mode
    :defer t)
  (setq ensime-startup-notification 'nil)
  (setq ensime-startup-snapshot-notification 'nil)
  (setq ensime-use-helm t)

  ;; init shortcut prefixes
  (dolist (prefix '(("mb" . "build")
		    ("mc" . "check")
		    ("md" . "debug")
		    ("mD" . "daemon")
		    ("me" . "errors")
		    ("mg" . "goto")
		    ("mh" . "docs")
		    ("mi" . "inspect")
		    ("mr" . "refactor")
		    ("mt" . "test")
		    ("ms" . "repl")
		    ("my" . "yank")))
    (spacelite/declare-prefix-for-mode 'scala-mode (car prefix)
      (cdr prefix)))

  ;; go start of code when a scala code is opened
  (add-hook 'scala-mode-hook (lambda ()
			       (scala-mode:goto-start-of-code)))

  ;; override goto definition with ensime
  (evil-define-key 'normal scala-mode-map (kbd "gd") 'ensime-edit-definition)

  ;; init keybindings
  (spacelite/set-leader-keys-for-major-mode 'scala-mode "Ds" 'ensime "gi" 'ensime-goto-impl "gt"
    'ensime-goto-test "br" 'ensime-sbt-do-run "ct" 'ensime-typecheck-current-buffer "el"
    'ensime-show-all-errors-and-warnings "ee" 'ensime-print-errors-at-point "gp"
    'ensime-pop-find-definition-stack "hh" 'ensime-show-doc-for-symbol-at-point "hT"
    'ensime-type-at-point-full-name "ht" 'ensime-type-at-point "hu"
    'ensime-show-uses-of-symbol-at-point "ra" 'ensime-refactor-add-type-annotation "rf"
    'ensime-format-source "rr" 'ensime-refactor-diff-rename "rt" 'ensime-import-type-at-point "gg"
    'ensime-edit-definition "gG" 'ensime-edit-definition-other-window "bc" 'ensime-sbt-do-compile))

(provide 'spacelite-scala)
