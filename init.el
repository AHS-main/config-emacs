;; -*- lexical-binding: t -*-

;; Measure startup time
(defun my/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds" (float-time (time-subtract after-init-time before-init-time)))
           gcs-done))
(add-hook 'emacs-startup-hook #'my/display-startup-time)

;; Load Org mode early
(require 'org)

;; Define the path to the main config file
(defvar my-config-org (expand-file-name "config.org" user-emacs-directory)
  "Path to the main config.org file.")

;; Auto-tangle config.org if modified
(defun my/tangle-config ()
  "Auto-tangle `config.org' if modified."
  (when (string-equal (buffer-file-name)
                      (expand-file-name my-config-org))
    (org-babel-tangle)))

(add-hook 'after-save-hook #'my/tangle-config)

;; Ensure `config.el` exists before loading
(let ((config-el (expand-file-name "config.el" user-emacs-directory)))
  (message "Checking for config.el at: %s" config-el)
  (unless (file-exists-p config-el)
    (message "config.el not found, tangling from config.org...")
    (org-babel-tangle-file my-config-org))
  (when (file-exists-p config-el)
    (message "Loading config.el from %s" config-el)
    (load-file config-el)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(counsel-projectile list-packages-ext go-projectile exec-path-from-shell magit helpful xenops company-reftex yasnippet cdlatex auctex company-math pyvenv blacken flycheck-pycheckers company-jedi flycheck pdf-view pdf-tools vertico undo-tree tablist orderless flyspell-correct expand-region doom-themes doom-modeline consult company all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
