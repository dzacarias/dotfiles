
(setq font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)

;; Don't beep. Don't visible-bell (fails on el capitan). Just blink the modeline on errors.

(setq visible-bell nil)
(setq ring-bell-function (lambda ()
                           (invert-face 'mode-line)
                           (run-with-timer 0.05 nil 'invert-face 'mode-line)))

;; Highlight current line
(global-hl-line-mode 1)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (blink-cursor-mode -1))

;; Make zooming affect frame instead of buffers
;(require 'zoom-frm)

;; Pretty icons
(require 'all-the-icons)

;; Default theme 
(load-theme 'spacemacs-dark)

;; Powerline
(require 'powerline)
(powerline-default-theme)

;; Line numbers for programming modes
(require 'nlinum)
(add-hook 'prog-mode-hook 'nlinum-mode)

;; File tree view
(require 'neotree)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq neo-smart-open t)


(provide 'appearance)
