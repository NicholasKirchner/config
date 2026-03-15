(require 'eshell-prompt-extras)

(setopt epe-git-renamed-char "^")

(defun truncate-at-period (s)
  (substring s 0 (or (string-match-p "\\." s) (length s))))

(defun eshell-live-job-count ()
  (seq-count (lambda (entry)
               (process-live-p (car entry)))
             eshell-process-list))

(defun git-stashed-p ()
  (epe-git-p-helper "git stash list 2> /dev/null"))

(defun git-stashed ()
  (and (git-stashed-p) "$"))

(defun my-prompt ()
  (let* ((cwd (abbreviate-file-name (eshell/pwd)))
         (jobs (eshell-live-job-count))
         (username (user-login-name))
         (hostname (truncate-at-period (system-name)))
         (operating-system (concat "esh on " (symbol-name system-type)))
         (x-stat eshell-last-command-status)
         (git-branch (epe-git-branch))
         (git-status (concat
                     (epe-git-deleted)
                     (epe-git-renamed)
                     (epe-git-modified)
                     (epe-git-added)
                     (epe-git-untracked)
                     (git-stashed))))
    (format "%s (%s)-(%s)-(%s)-(%s)-(%s) \n%s "
              (if (< 0 x-stat)
                  (propertize "X(" 'face '(:foreground "#d54e53"))
                  (propertize ":)" 'face '(:foreground "#e7c547")))
              jobs
              (propertize (concat username "@" hostname) 'face '(:foreground "#b9ca4a"))
              (propertize cwd 'face '(:foreground "#c397d8"))
              (propertize (concat git-branch " [" git-status "]") 'face '(:foreground "#e7c547"))
              (propertize operating-system 'face '(:foreground "#70c0b1"))
              (propertize "λ" 'face '(:foreground "#b9ca4a")))))

(setopt eshell-prompt-function 'my-prompt)
(setopt eshell-prompt-regexp "λ ")
