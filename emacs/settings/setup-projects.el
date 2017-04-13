(require 'neotree)

;; Change keybinding prefix BEFORE projectile is required
(setq projectile-keymap-prefix (kbd "C-c C-p"))

(require 'projectile)

;; Projectile enable
(projectile-mode)

;; Use completion with ivy/counsel
(counsel-projectile-on)

;; Side navigation tree setup
(setq projectile-switch-project-action 'neotree-projectile-action)

(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (projectile-project-root))
        (file-name (buffer-file-name)))
    (neotree-toggle)
    (if project-dir
        (if (neo-global--window-exists-p)
            (progn
              (neotree-dir project-dir)
              (neotree-find file-name)))
      (message "Could not find git project root."))))

(global-set-key [f8] 'neotree-project-dir)

(provide 'setup-projects)
