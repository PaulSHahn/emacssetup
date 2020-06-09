;;; initfile --- Summary:
;;; Commentary:
;; Emacs 26 and newer
;;; Code:

(setq python-indent 4)
(setq python-indent-offset 4)

;; Emacs Python IDE
(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))

;; reformat Python code on save
;;(use-package yapfify
;;  :ensure t
;;  :init
;;  (add-hook 'python-mode-hook 'yapf-mode))

;; Enable Flycheck
(with-eval-after-load 'elpy (setq elpy-modules (delq 'elpy-module-flymake elpy-modules)) (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Enable autopep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; Open Bazel files in python mode
(add-to-list 'auto-mode-alist '("WORKSPACE" . python-mode))
(add-to-list 'auto-mode-alist '("BUILD" . python-mode))

(provide 'setup-python)
