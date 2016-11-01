;; Travis Poulsen - 2016

;; set up package sources
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "http://melpa.org/packages/")))
(package-refresh-contents)

;; using nix on osx, the emacsclient path isn't set properly
;; this sets it to the emacsclient installed with 25.1 via nix
(setq-default with-editor-emacsclient-executable
	      "/nix/store/sk4ifn4k98gaizr4ny5lhcy4msiyd5d3-emacs-25.1/bin/emacsclient")

;; after-init-hooks
(add-hook 'after-init-hook (lambda ()
			     (load-theme 'monokai t)))

;; evil-mode config
(require 'evil)
(require 'evil-magit)
(require 'powerline)
(require 'spaceline-config)
(spaceline-spacemacs-theme)

(evil-mode 1)
(global-linum-mode 1)
(ivy-mode 1)
(menu-bar-mode -1)
(projectile-mode 1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

;; ivy config
(setq ivy-re-builders-alist
      '((read-file-name-internal . ivy--regex-fuzzy)
        (t . ivy--regex-plus)))
(setq magit-completing-read-function 'ivy-completing-read)
(setq projectile-completion-system 'ivy)

;; persp-mode recommended config
(with-eval-after-load "persp-mode-autoloads"
  (setq wg-morph-on nil) ;; switch off animation
  (setq persp-autokill-buffer-on-remove 'kill-weak)
  (add-hook 'after-init-hook #'(lambda () (persp-mode 1))))

(setq-default left-fringe-width 10)

;; keybindings
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "M-p") 'ace-window)
(global-set-key (kbd "C-x /") 'evil-window-vsplit)
(global-set-key (kbd "C-x -") 'evil-window-split)

;; hydra key bindings
(defhydra hydra-file-menu (:color pink
				  :hint nil)
  "
^Find^
^^^^^^
_f_: find file
_/_: find in file
"
  ("f" find-file nil)
  ("/" swiper)
  ("c" nil "cancel" :color blue))
(global-set-key (kbd "C-c f") 'hydra-file-menu/body)

(defhydra hydra-window (:color pink
			       :hint nil)
  "
^Window^
^^^^^^^^^
_/_: vertical split
_-_: horizontal split
_c_: close window
"
  ("/" evil-window-vsplit)
  ("-" evil-window-split)
  ("c" evil-window-delete :color blue))
(global-set-key (kbd "C-c w") 'hydra-window/body)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (racket-mode alchemist intero ivy-hydra hydra powerline-evil spaceline golden-ratio ace-window flycheck flx persp-projectile projectile persp-mode evil-magit magit counsel swiper ivy evil monokai-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#272822" :foreground "#F8F8F2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "Fira-Code-Retina")))))
