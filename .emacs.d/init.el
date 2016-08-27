;; -*- mode: emacs-lisp -*-
;; Simple .emacs configuration

;; ---------------------
;; -- Global Settings --
;; ---------------------
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'cl)
(require 'ido)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
(require 'dired-x)
(require 'column-marker)
(require 'linum)
(require 'smooth-scrolling)
(require 'whitespace)
(require 'compile)
(require 'fill-column-indicator)
;; (require 'multiple-cursors)
(ido-mode t)
(menu-bar-mode -1)
(setq-default indent-tabs-mode nil)
(normal-erase-is-backspace-mode 0)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq column-number-mode t)
(setq inhibit-startup-message t)
(setq save-abbrevs nil)
(setq show-trailing-whitespace t)
(setq suggest-key-bindings t)
(setq vc-follow-symlinks t)
(setq make-backup-files nil)
(setq whitespace-style '(face trailing))
(setq fci-rule-column 80)
(setq fci-rule-color "darkblue")
(setq-default tab-width 4)

;; enable marmalade and melpa packages
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ))

;; gas mode
(require 'gas-mode)
(add-to-list 'auto-mode-alist '("\\.S\\'" . gas-mode))

;; required for ispell
(setq exec-path (append "/usr/local/bin" exec-path))

;; neotree setup
(add-to-list 'load-path "~/.emacs.d/lisp/neotree")
(require 'neotree)

;; assembler mode configuration
;; (require 'asm-mode)
;; (add-hook 'asm-mode-hook (lambda ()
;;                            (electric-indent-mode -1)
;;                            (setq tab-stop-list (number-sequence 10 85 6))
;;                            ; modified from (define-key text-mode-map (kbd "TAB") 'tab-to-tab-stop)
;;                            (define-key asm-mode-map (kbd "TAB") 'tab-to-tab-stop)
;;                            (setq indent-tabs-mode nil)
;;                            ))

;; verilog configuration
(setq verilog-indent-level 2
      verilog-indent-level-module 2
      verilog-indent-level-declaration 2
      verilog-indent-level-behavioral 2
      verilog-indent-level-directive 1
      verilog-indent-begin-after-if t
      verilog-indent-lists t
      verilog-indent-declaration-macros nil
      verilog-case-indent 2
      verilog-auto-newline nil
      verilog-minimum-comment-distance 12
      verilog-align-ifelse t
      verilog-auto-endcomments nil
      )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit autoface-default :strike-through nil :underline nil :slant normal :weight normal :height 120 :width normal :family "monaco"))))
 '(column-marker-1 ((t (:background "red"))))
 '(diff-added ((t (:foreground "cyan"))))
 '(flymake-errline ((((class color) (background light)) (:background "Red"))))
 '(font-lock-comment-face ((((class color) (min-colors 8) (background light)) (:foreground "red"))))
 '(fundamental-mode-default ((t (:inherit default))))
 '(highlight ((((class color) (min-colors 8)) (:background "white" :foreground "magenta"))))
 '(isearch ((((class color) (min-colors 8)) (:background "yellow" :foreground "black"))))
 '(italic ((t (:foreground "white" :slant italic))))
 '(linum ((t (:foreground "green" :weight normal))))
 '(region ((((class color) (min-colors 8)) (:background "white" :foreground "magenta"))))
 '(secondary-selection ((((class color) (min-colors 8)) (:background "gray" :foreground "cyan"))))
 '(show-paren-match ((((class color) (background light)) (:background "black"))))
 '(vertical-border ((t nil))))

;; ------------
;; -- Macros --
;; ------------
(load "defuns-config.el")
(global-set-key "\M-=" 'align-equals)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c;" 'comment-or-uncomment-region)
(global-set-key "\M-n" 'next5)
(global-set-key "\M-p" 'prev5)
(global-set-key "\C-o" 'other-window)
(global-set-key "\C-i" 'back-window)
(global-set-key "\C-z" 'zap-to-char)
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\M-d" 'delete-word)
(global-set-key "\M-h" 'backward-delete-word)
(global-set-key "\M-u" 'zap-to-char)
(global-set-key "\M-c" 'neotree-toggle)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
