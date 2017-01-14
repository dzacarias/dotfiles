;; change command to meta, and ignore option to use weird Norwegian keyboard
(setq mac-option-modifier 'none)
(setq mac-command-modifier 'meta)
(setq ns-function-modifier 'hyper)

;; mac friendly font
(when window-system
  (setq dzacarias/default-font "-apple-Menlo-medium-normal-normal-*-14-*-*-*-m-0-iso10646-1")
  (setq dzacarias/presentation-font "-apple-Menlo-medium-normal-normal-*-21-*-*-*-m-0-iso10646-1")
  (set-face-attribute 'default nil :font dzacarias/default-font))

;; Move to trash when deleting stuff
(setq delete-by-moving-to-trash t
      trash-directory "~/.Trash/emacs")

;; Ignore .DS_Store files with ido mode
(add-to-list 'ido-ignore-files "\\.DS_Store")

;; Don't open files from the workspace in a new frame
(setq ns-pop-up-frames nil)

;; Use aspell for spell checking: brew install aspell --lang=en
(setq ispell-program-name "/usr/local/bin/aspell")

;; Open files
(defun mac-open-current-file ()
  (interactive)
  (shell-command (concat "open " (buffer-file-name))))

(global-set-key (kbd "C-c C-S-o") 'mac-open-current-file)

;; fix osx weirdness with magit avatars
(setq-default magit-revision-use-gravatar-kludge t)


(provide 'mac)
