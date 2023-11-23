;; Custom file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (and custom-file
	   (file-exists-p custom-file))
  (load custom-file nil :nomessage))

;; Load lisp files
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; 42 header
(load "list.el")
(load "string.el")
(load "comments.el")
(load "header.el")

;; Package
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(eval-when-compile
  (require 'use-package))

;; Theme
(use-package modus-themes
  :ensure t
  :config (load-theme 'modus-vivendi t))
