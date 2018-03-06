(package-initialize)

(load-file (concat (file-name-directory user-emacs-directory)
	"core/core-load-paths.el"))

(setq use-package-always-ensure t)
(setq gc-cons-threshold most-positive-fixnum)

(require 'core-spacelite)
(require 'spacelite-base)
(require 'spacelite-langs)
(require 'spacelite-utils)

(spacelite/init)
(spacelite/init-base)
(spacelite/init-langs)
(spacelite/init-utils)

(use-package exec-path-from-shell :defer t :config
	(when (memq window-system '(mac ns x))
	  (exec-path-from-shell-initialize)))
