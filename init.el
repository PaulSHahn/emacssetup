
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (projectile-sift magithub whitespace-cleanup-mode prettier-js tide js2-mode json-mode pycoverage helm-swoop projectile anzu helm helm-projectile iedit markdown-mode markdown-mode+ markdown-preview-mode sr-speedbar use-package volatile-highlights ws-butler undo-tree magit py-autopep8 elpy flycheck-yamllint flymake-yaml yaml-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")
(require 'setup-general)
(require 'setup-helm)
(require 'setup-editing)
(require 'setup-python)
(require 'setup-javascript)
