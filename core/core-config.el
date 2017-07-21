;; Copyright (c) 2017 Hüseyin Zengin
;;
;; Author: Hüseyin Zengin <hzenginx@gmail.com>
;; URL: https://github.com/hzenginx/spacelite
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar config-scratch-mode 'text-mode)

(defvar config-leader-key "SPC")

(defvar config-major-mode-leader-key ",")

(defvar config-ex-command-key ":")

(defvar config-command-key "SPC")

(defvar config-which-key-delay 0.4)

(defvar config-keep-backups nil)

;; font settings
(defvar config-font-family "Hasklig")
(defvar config-font-height 140)

;; enable only if you are using emacs-mac
(defvar config-enable-ligatures t)

(provide 'core-config)
