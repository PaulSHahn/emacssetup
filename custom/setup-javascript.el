;;; initfile --- Summary:
;;; Commentary:
;; Emacs 26 and newer
;;; Code:

(defun setup-tide-mode ()
  "Setup function for tide."
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(setq company-tooltip-align-annotations t)

(add-hook 'js-mode-hook #'setup-tide-mode)

(add-hook 'js-mode-hook 'prettier-js-mode)

(setq prettier-js-args '(
                         "--trailing-comma" "none"
                         "--bracket-spacing" "true"
                         "--single-quote" "true"
                         "--no-semi" "true"
                         "--jsx-single-quote" "true"
                         "--jsx-bracket-same-line" "true"
                         "--print-width" "100"))

;; json-mode
(use-package json-mode
  :ensure t
  :mode ("\\.json\\'" "\\.imp\\'"))

(provide 'setup-javascript)
