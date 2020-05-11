(setq-default fill-column 160)

;; uncomment this and comment out ws-butler if you
;; really want to nuke the entire file and get rid
;; of all whitespace errors in it. This will bloat
;; your files commit size.
;;(global-whitespace-cleanup-mode)

(setq global-mark-ring-max 5000;
      mark-ring-max 5000;
      mode-require-final-newline t;
      tab-width 4;
      )

(add-hook 'sh-mode-hook (lambda()
                          (setq tab-width 4)))

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(setq-default indent-tabs-mode nil)
(delete-selection-mode)
(global-set-key (kbd "RET") 'newline-and-indent)

(setq kill-ring-max 5000;
      kill-whole-line t;
      )


;; show whitespace in diff mode
(add-hook 'diff-mode-hook (lambda()
                            (setq-local whitespace-style
                                        '(face
                                          tabs
                                          tab-mark
                                          spaces
                                          space-mark
                                          trailing
                                          indentation::space
                                          indentation::tab
                                          newline
                                          newline-mark))
                            (whitespace-mode 1)))

(use-package volatile-highlights
  :init
  (volatile-highlights-mode t))

(use-package undo-tree
  :init
  (global-undo-tree-mode 1))

(use-package yasnippet
  :defer t
  :init
  (add-hook 'prog-mode-hook 'yas-minor-mode))

;; comment this out if you turn on global-whitespace-cleanup-mode
(use-package ws-butler
  :init
  (add-hook 'prog-mode-hook 'ws-butler-mode)
  (add-hook 'text-mode 'ws-butler-mode)
  (add-hook 'fundamental-mode 'ws-butler-mode))

(use-package anzu
  :init
  (global-anzu-mode)
  (global-set-key (kbd "M-%") 'anzu-query-replace)
  (global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp))

(use-package iedit
  :bind (("C-;" . iedit-mode))
  :init
  (setq iedit-toggle-key-default nil))


(global-set-key (kbd "C-c i") 'indent-region-or-buffer)

(provide 'setup-editing)
