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

;; Programming
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(column-number-mode 1)

;; C
(defun ism/setup-c ()
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)
  (setq-default c-basic-offset 4
		tab-width 4
		indent-tabs-mode t))

(add-hook 'c-mode-hook 'ism/setup-c)
