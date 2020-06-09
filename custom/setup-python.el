(setq python-indent-offset 4)

(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))

;; Enable Flycheck
(with-eval-after-load 'elpy (setq elpy-modules (delq 'elpy-module-flymake elpy-modules)) (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Enable autopep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(provide 'setup-python)
