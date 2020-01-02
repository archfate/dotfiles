
;; .emacs.d/init.el


;; ===================================

;; MELPA Package Support

;; ===================================

;; Enables basic packaging support

(require 'package)


;; Adds the Melpa archive to the list of available repositories

(add-to-list 'package-archives

             '("melpa" . "http://melpa.org/packages/") t)


;; Initializes the package infrastructure

(package-initialize)


;; If there are no archived package contents, refresh them

(when (not package-archive-contents)

  (package-refresh-contents))


;; Installs packages

;;

;; myPackages contains a list of package names

(defvar myPackages

  '(better-defaults                 ;; Set up some better Emacs defaults
    elpy
    flycheck
    py-autopep8
    blacken
    material-theme                  ;; Theme

    )

  )


;; Scans the list in myPackages

;; If the package listed is not already installed, install it

(mapc #'(lambda (package)

          (unless (package-installed-p package)

            (package-install package)))

      myPackages)


;; ===================================

;; Basic Customization

;; ===================================


(setq inhibit-startup-message t)    ;; Hide the startup message

(load-theme 'material t)            ;; Load material theme

(global-linum-mode t)               ;; Enable line numbers globally

;; ====================================
;; Load File
;; ====================================

;; Eww linkpiper

;; ====================================

;; Key and other features

;; ====================================

;; Enable Xclip Clipboard back to back
;; use xclip to copy/paste in emacs-nox
(unless window-system
  (when (getenv "DISPLAY")
    (defun xclip-cut-function (text &optional push)
      (with-temp-buffer
	(insert text)
	(call-process-region (point-min) (point-max) "xclip" nil 0 nil "-i" "-selection" "clipboard")))
    (defun xclip-paste-function()
      (let ((xclip-output (shell-command-to-string "xclip -o -selection clipboard")))
	(unless (string= (car kill-ring) xclip-output)
	  xclip-output )))
    (setq interprogram-cut-function 'xclip-cut-function)
    (setq interprogram-paste-function 'xclip-paste-function)
    ))
;; ====================================

;; Development Setup

;; ====================================

;; Enable elpy

(elpy-enable)


;; Enable Flycheck

(when (require 'flycheck nil t)

  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))

  (add-hook 'elpy-mode-hook 'flycheck-mode))


;; Enable autopep8

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; User-Defined init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (w3m xclip material-theme blacken py-autopep8 flycheck elpy better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
