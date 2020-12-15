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

(setq elpy-rpc-virtualenv-path 'current)

;; reformat Python code on save
;;(use-package yapfify
;;  :ensure t
;;  :init
;;  (add-hook 'python-mode-hook 'yapf-mode))

;;(add-hook 'elpy-mode-hook (lambda ()
;;                            (add-hook 'before-save-hook
;;                                      'elpy-format-code nil t)))

;; Enable Flycheck
(with-eval-after-load 'elpy (setq elpy-modules (delq 'elpy-module-flymake elpy-modules)) (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Enable autopep8
;; (require 'py-autopep8)
;;(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(setq elpy-remove-modeline-lighter t)

(advice-add 'elpy-modules-remove-modeline-lighter
            :around (lambda (fun &rest args)
                      (unless (eq (car args) 'flymake-mode)
                        (apply fun args))))

;; Open Bazel files in python mode
(add-to-list 'auto-mode-alist '("WORKSPACE" . python-mode))
(add-to-list 'auto-mode-alist '("BUILD" . python-mode))

(provide 'setup-python)
