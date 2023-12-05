;;; LOADING

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


;;; GENERAL SETTINGS

;; Sensible defaults
(recentf-mode 1)
(save-place-mode 1)
(global-auto-revert-mode 1)

(delete-selection-mode 1)
(column-number-mode 1)
(electric-pair-mode 1)

(setq use-dialog-box nil)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Fonts
(set-face-attribute 'default nil :font "JetBrains Mono NL" :height 110)

;; Theme
(load-theme 'modus-vivendi t)

(use-package modus-themes
  :ensure t)

;; Completion
(use-package vertico
  :ensure t
  :init (vertico-mode))

(use-package corfu
  :ensure t
  :init (global-corfu-mode)
  :custom (corfu-auto t))

(use-package marginalia
  :ensure t
  :init (marginalia-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))


;;; PROGRAMMING

;; General editing
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq-default display-line-numbers-width 3)

(setq backward-delete-char-untabify-method 'hungry)
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; LSP
(use-package eglot
  :ensure t)

;; C at 42
(defun ism/setup-c ()
  (setq-local tab-width 4)
  (setq c-basic-offset 4)
  (setq c-default-style "linux")
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)
  (eglot-ensure))

(add-hook 'c-mode-hook 'ism/setup-c)
