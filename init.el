;;; initfile --- Summary:
;;; Commentary:
;; Emacs 26 and newer
;;; Code:

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
 '(markdown-command
   (concat "/usr/bin/pandoc" " --from=markdown --to=html" " --standalone -S --mathjax --highlight-style=tango"))
 '(package-selected-packages
   (quote
    (bazel-mode git-timemachine flyspell-correct-helm modern-cpp-font-lock projectile-sift magit magithub git-gutter whitespace-cleanup-mode prettier-js tide js2-mode json-mode pycoverage projectile anzu helm helm-swoop helm-projectile company company-box helm-company iedit markdown-mode markdown-mode+ markdown-preview-mode sr-speedbar use-package volatile-highlights ws-butler undo-tree py-autopep8 elpy flycheck flycheck-coverity flycheck-tip flycheck-yamllint flymake-yaml yaml-mode lsp-mode lsp-ui moder-cpp-font-lock company-lsp window-numbering py-yapf yapfify cmake-mode))))

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
(require 'setup-git)
(require 'setup-python)
(require 'setup-javascript)
(require 'setup-c)
