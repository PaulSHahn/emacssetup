;; enable line number and column number
(setq column-number-mode t)
(setq line-number-mode t)
;; enable visible bell
(setq visible-bell 1)
;; syntax high lighting
(setq global-font-lock-mode t)
(setq transient-mark-mode t)
(show-paren-mode 1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(display-time)

;; calendar information
(setq calendar-latitude 33.43)
(setq calendar-longitude -112.02)
(setq calendar-location-name "Phoenix, AZ")
(setq calendar-daylight-savings-ends nil)
(setq calendar-daylight-savings-starts nil)

;; ediff mode split
(setq ediff-split-window-function 'split-window-horizontally)

;; move the mouse coursor
(mouse-avoidance-mode 'cat-and-mouse)

(setq inhibit-startup-message t)

(add-hook 'prog-mode-hook
	  (lambda () (interactive)
	    (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

(setq-default tab-width 4)

(provide 'setup-general)
