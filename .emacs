(setq inhibit-startup-message t)

(show-paren-mode 1)
(setq show-paren-style 'parenthesis)
(set-language-environment "UTF-8")

(global-set-key (kbd "<f12>") 'shell)
(global-set-key (kbd "<f5>") 'shell-current-line)
(global-set-key (kbd "<f6>") 'shell-select-region)

(defun ielm-auto-complete ()
  "Enables `auto-complete' support in \\[ielm]."
  (setq ac-sources '(ac-source-functions
                     ac-source-variables
                     ac-source-features
                     ac-source-symbols
                     ac-source-words-in-same-mode-buffers))
  (add-to-list 'ac-modes 'inferior-emacs-lisp-mode)
  (auto-complete-mode 1))
(setq tab-always-indent 'complete)
(add-hook 'ielm-mode-hook 'ielm-auto-complete)

(transient-mark-mode 1)
(defun select-current-line ()
  "Select the current line"
  (interactive)
  (end-of-line) ; move to end of line
  (set-mark (line-beginning-position)))



(defun shell-current-line ()
  (interactive)
  (select-current-line)
  (setq rs (shell-command-to-string (buffer-substring (region-beginning) (region-end))))
  (setq CurrentBuffer (current-buffer))
  (set-buffer "shout.txt")
  (end-of-buffer)
  (insert rs)
  (set-buffer CurrentBuffer))
(defun shell-select-region (start end)
  (interactive "r")
  (setq rs (shell-command-to-string (buffer-substring start end)))
  (setq CurrentBuffer (current-buffer))
  (set-buffer "shout.txt")
  (end-of-buffer)
  (insert rs)
  (set-buffer CurrentBuffer))


