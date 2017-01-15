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
   '(
;;;  General 
     better-defaults
     magit
     ace-jump-mode
     flycheck
     flycheck-pos-tip
     yasnippet
     smartparens
     whitespace-cleanup-mode

;;;  Programming modes
     rbenv
     markdown-mode

;;;  HTTP 
     restclient     

;;;  Project and navigation
     projectile
     neotree

;;;  Appearance
     nlinum
     powerline
     all-the-icons
     spacemacs-theme                                        
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

(setq global-whitespace-cleanup-mode t)

;; Setup extensions
;(eval-after-load 'org '(require 'setup-org))
;(eval-after-load 'dired '(require 'setup-dired))
;(eval-after-load 'magit '(require 'setup-magit))
;(eval-after-load 'grep '(require 'setup-rgrep))
;(eval-after-load 'shell '(require 'setup-shell))
(require 'setup-rbenv)
;(require 'setup-hippie)
;(require 'setup-yasnippet)
;(require 'setup-perspective)
;(require 'setup-html-mode)
;(require 'setup-paredit)

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

