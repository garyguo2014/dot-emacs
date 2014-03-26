(add-to-list 'load-path "/home/guoguangyi/elisp")
(add-to-list 'load-path "/home/guoguangyi/elisp/color-theme-6.6.0")

(require 'color-theme)
(load-file "/home/guoguangyi/elisp/color-theme-6.6.0/themes/color-theme-library.el")
;;(color-theme-ld-dark)
;;(color-theme-dark-laptop)
;;(color-theme-pok-wob)
;;(color-theme-emacs-nw)
;;(color-theme-xemacs)
;;(color-theme-feng-shui)
;;(color-theme-high-contrast)
;;(set-background-color "Black")
(color-theme-sitaramv-nt)
(set-background-color "gray90")
;;(color-theme-bharadwaj-slate)

(require 'xcscope)
(add-hook 'java-mode-common-hook '(lambda()(require 'xcscope)))
 (add-hook 'java-mode-hook (function cscope:hook))

(require 'htmlize)


(setq load-path (cons "/home/guoguangyi/elisp/org-7.9.4/lisp" load-path))
(setq load-path (cons "/home/guoguangyi/elisp/org-7.9.4/orgdir/contrib/lisp" load-path))

;; The following lines are always needed. Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode)) ; not needed since Emacs 22.2
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(add-hook 'org-mode-hook
(lambda () (setq truncate-lines nil)))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)



(setq mouse-drag-copy-region t)
(setq org-src-fontify-nativel t)


(require 'wb-line-number)
(wb-line-number-toggle)
(global-set-key [f7] 'wb-line-number-toggle)


(global-set-key [f5] 'goto-line)
(require'redo)
(global-set-key [f6] 'redo)

(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; display buffer name or absolute file path name in the frame title
(defun frame-title-string ()
  "Return the file name of current buffer, using ~ if under home directory"
  (let
	  ((fname (or
		   (buffer-file-name (current-buffer))
		   (buffer-name)))
	   (max-len 100))
	(when (string-match (getenv "HOME") fname)
	  (setq fname (replace-match "~" t t fname)))
	(if (> (length fname) max-len)
	(setq fname
		  (concat "..."
			  (substring fname (- (length fname) max-len)))))
	fname))
(setq frame-title-format '(:eval (frame-title-string)))

(setq cscope-do-not-update-database t)

(setq default-tab-width 4)
(add-hook 'c-mode-hook 'linux-c-mode)
(defun linux-c-mode()
  (setq c-basic-offset 4)
  )

(require 'sr-speedbar)
(setq indent-tabs-mode t)
(setq tab-width 4)
(setq c-basic-offset 4)
(global-set-key (kbd "RET") 'newline-and-indent)

(column-number-mode t)

(set-buffer-file-coding-system 'unix)


(defun my-one-blank-line-end ()
"Leave exactly one blank line at the end of the file."
 (interactive)
 (save-excursion
	 (goto-char (point-max))
	 (open-line 1)
	 (delete-blank-lines)))

(setq whitespace-check-indent-whitespace nil) ; don't touch my indent tabs
(defun my-write-file-hook ()
  (whitespace-cleanup)                  ; delelte trailing blanks/tabs.
  (my-one-blank-line-end))              ; leave one line in the end.

;(add-hook 'write-file-hooks 'my-write-file-hook)


(desktop-save-mode 1)

(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-interval 10)

;;no beep when error
(setq ring-bell-function 'ignore)

(defun dos2unix
	(buffer)
	  "Automate M-% C-q C-m RET C-q C-j RET"
	(interactive "*b")
	(save-excursion
		(goto-char (point-min))
		(while (search-forward (string ?\C-m) nil t)
				  (replace-match "" nil t))))

(defun dos2unix-new-line
	(buffer)
	  "Automate M-% C-q C-m RET C-q C-j RET"
	(interactive "*b")
	(save-excursion
		(goto-char (point-min))
		(while (search-forward (string ?\C-m) nil t)
				  (replace-match (string ?\C-j) nil t))))


(global-set-key (kbd "C-x r") 'redo)
(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)
(global-set-key (kbd "C-x c") 'comment-region)
(global-set-key (kbd "C-x u") 'uncomment-region)

(when (fboundp 'winner-mode)
(winner-mode)
(windmove-default-keybindings))

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)

(setq org-src-fontify-natively t)

