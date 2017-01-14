;; No splash screen 

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq inhibit-startup-message t)

;; Dependencies dir
(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path settings-dir)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(save-place-mode 1) 

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; Setup packages
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(better-defaults
     magit
     ace-jump-mode
;     hydra
     markdown-mode
;     fill-column-indicator
     flycheck
;     flycheck-pos-tip
;     flycheck-clojure
;     flx
;     f
;     flx-ido
;     dired-details
     yasnippet
     smartparens
;     ido-vertical-mode
;     ido-at-point
;     simple-httpd
;     guide-key
;     restclient
;     highlight-escape-sequences
;     whitespace-cleanup-mode
;     prodigy
;     yesql-ghosts
;     string-edit
     rbenv
;    Project stuff
     projectile
     neotree
     helm
;;;  Appearance
     nlinum
     spacemacs-theme                                        
     powerline
     all-the-icons
;     zoom-frm
    )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Set up appearance early
(require 'appearance)

;; Lets start with a smattering of sanity
(require 'better-defaults)

;; Setup environment variables from the user's shell.
(when is-mac
  (require-package 'exec-path-from-shell)
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize))

;; guide-key
;(require 'guide-key)
;(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x v" "C-x 8" "C-x +"))
;(guide-key-mode 1)
;(setq guide-key/recursive-key-sequence-flag t)
;(setq guide-key/popup-window-position 'bottom)

;; Setup extensions
;(eval-after-load 'ido '(require 'setup-ido))
;(eval-after-load 'org '(require 'setup-org))
;(eval-after-load 'dired '(require 'setup-dired))
;(eval-after-load 'magit '(require 'setup-magit))
;(eval-after-load 'grep '(require 'setup-rgrep))
;(eval-after-load 'shell '(require 'setup-shell))
(require 'setup-rbenv)
;(require 'setup-hippie)
;(require 'setup-yasnippet)
;(require 'setup-perspective)
;(require 'setup-ffip)
;(require 'setup-html-mode)
;(require 'setup-paredit)

;(require 'prodigy)
;(global-set-key (kbd "C-x M-m") 'prodigy)

;; Default setup of smartparens
;(require 'smartparens-config)
;(setq sp-autoescape-string-quote nil)
;(--each '(css-mode-hook
;          restclient-mode-hook
;          js-mode-hook
;          java-mode
;          ruby-mode
;          markdown-mode
;          groovy-mode
;          scala-mode)
;  (add-hook it 'turn-on-smartparens-mode))

;; Language specific setup files
;(eval-after-load 'js2-mode '(require 'setup-js2-mode))
;(eval-after-load 'ruby-mode '(require 'setup-ruby-mode))
;(eval-after-load 'clojure-mode '(require 'setup-clojure-mode))
;(eval-after-load 'markdown-mode '(require 'setup-markdown-mode))


;; Map files to modes
;(require 'mode-mappings)

;; Setup key bindings
;(require 'key-bindings)

;; Misc
(when is-mac (require 'mac))

;; Elisp go-to-definition with M-. and back again with M-,
;(autoload 'elisp-slime-nav-mode "elisp-slime-nav")
;(add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode t) (eldoc-mode 1)))

;; Emacs server
;(require 'server)
;(unless (server-running-p)
;  (server-start))

;; Run at full power please
;(put 'downcase-region 'disabled nil)
;(put 'upcase-region 'disabled nil)
;(put 'narrow-to-region 'disabled nil)

