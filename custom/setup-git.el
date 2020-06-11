;;; initfile --- Summary:
;;; Commentary:
;; Emacs 26 and newer
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; git setup
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; use magit
(use-package magit
  :ensure t
  )
;; use git-gutter to keep track of changes in real time
(use-package git-gutter
  :ensure t
  :diminish git-gutter-mode
  :defer 2
  :init
  (eval-when-compile
    ;; Silence missing function warnings
    (declare-function global-git-gutter-mode "git-gutter.el"))
  :config
  ;; If you enable global minor mode
  (global-git-gutter-mode t)
  )

;; Auto update every 5 seconds
(setq git-gutter:update-interval 10)

;; use git-timemachine to navigate between file versions
(use-package git-timemachine
  :ensure t
  )

(provide 'setup-git)
