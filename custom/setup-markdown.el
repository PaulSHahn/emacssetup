;;; setup-editing --- Summary:
;;; Commentary:
;; Emacs 26 and newer
;;; Code:

;;;;;;;;;;;;;;;;;;;
;; markdown support
;;;;;;;;;;;;;;;;;;;;
(use-package markdown-mode
  :ensure t
  :mode ("\\.md'" "\\.markdown\\'")
  )

;; custom markdown pandoc settings
(setq markdown-command
   (concat "/usr/bin/pandoc"
           " --from=markdown --to=html --standalone --mathjax --highlight-style=tango --metadata pagetitle='markdown-preview-mode'") )

(add-hook 'markdown-mode-hook
          (lambda ()
            (set-fill-column 80)))

(setq markdown-css-paths '("/home/paul/development/projects/cpp/cpp-code-standards/css/document.css"))
(setq markdown-preview-stylesheets (list "https://raw.githubusercontent.com/PaulSHahn/cpp-code-standards/master/css/document.css"))

(provide 'setup-markdown)
