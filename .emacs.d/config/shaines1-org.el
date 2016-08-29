;;; shaines1-custom.el --- Settings created by customize  -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Shaine Strullmyer

;; Author: Shaine Strullmyer <shaines1@gmail.com>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.


;;; Commentary:

;; A significant amount of this code is derived from
;; http://doc.norang.ca/org-mode.html . License is provided below:

;; Copyright (C)  2013  Bernt Hansen.
;; Permission is granted to copy, distribute and/or modify this document
;; under the terms of the GNU Free Documentation License, Version 1.3
;; or any later version published by the Free Software Foundation;
;; with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.

;; Code in this document is free software: you can redistribute it
;; and/or modify it under the terms of the GNU General Public
;; License as published by the Free Software Foundation, either
;; version 3 of the License, or (at your option) any later version.

;; This code is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

(require 'org)
(require 'org-agenda)

;;
;; Variables
(defvar shaines1/organization-task-id "eb155a82-92b2-4f25-a3c6-0304591af2f9")
(defvar shaines1/lunch-task-id "eb155a82-92b2-4f25-a3c6-0304591af2f9")
(defvar shaines1/hide-scheduled-and-waiting-next-tasks t)
(setq shaines1/keep-clock-running nil)


;;
;; Pre-settings function calls
;; Resume clocking task when emacs is restarted
(org-clock-persistence-insinuate)


;;
;; Key definitions
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(global-set-key (kbd "<f12>") 'org-agenda)
(global-set-key (kbd "<f9> a") 'shaines1/show-org-agenda)
(global-set-key (kbd "<f9> c") 'calendar)
(global-set-key (kbd "<f9> I") 'shaines1/punch-in)
(global-set-key (kbd "<f9> O") 'shaines1/punch-out)
(global-set-key (kbd "<f9> u") 'shaines1/clock-in-lunch-task)
(global-set-key (kbd "<f9> l") 'org-toggle-link-display)
(global-set-key (kbd "<f9> SPC") 'shaines1/clock-in-last-task)
(global-set-key (kbd "<f11>") 'org-clock-goto)
(global-set-key (kbd "C-<f11>") 'org-clock-in)
(global-set-key (kbd "C-c c") 'org-capture)


;;
;; Settings
;; General settings
(add-to-list 'auto-mode-alist '("\\.\\(org\\|txt\\)$" . org-mode))
(setq org-modules (quote (org-docview org-habit org-info)))
(setq org-global-properties (quote (("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")
                                    ("STYLE_ALL" . "habit"))))
(setq org-clock-history-length 23)
(setq org-completion-use-ido t)

;; General appearance
(setq org-hide-leading-stars t)
(setq org-startup-indented t)
(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))
(setq org-startup-folded t)
(setq org-show-hierarchy-above t)
(setq org-show-following-heading t)
(setq org-use-sub-superscripts nil)

;; Directories / files
(setq org-agenda-files (quote ("~/.emacs.d/org")))
(setq org-directory "~/.emacs.d/org")
(setq org-agenda-diary-file "~/.emacs.d/org/diary.org")
(setq org-default-notes-file "~/.emacs.d/org/refile.org")

;; Todo / tag selection
(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

;; Refile
(setq org-refile-use-outline-path t)
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-targets (quote ((nil :maxlevel . 9) (org-agenda-files :maxlevel . 9))))

(setq org-refile-allow-creating-parent-nodes (quote confirm))
(setq org-refile-target-verify-function 'shaines1/verify-refile-target)

;; Agenda display options
(setq org-agenda-dim-blocked-tasks nil)
(setq org-agenda-compact-blocks t)
(setq org-agenda-clockreport-parameter-plist
      (quote (:link t :maxlevel 5 :fileskip0 t :compact t :narrow 80)))
(setq org-agenda-log-mode-items (quote (closed clock state)))
(setq org-agenda-span 'day)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-timestamp-if-done t)
(setq org-agenda-include-diary t)
(setq org-agenda-insert-diary-extract-time t)
(setq org-agenda-time-grid (quote ((daily today remove-match)
                                   #("----------------" 0 16 (org-heading t))
                                   (0700 0800 0900 1000 1100 1200 1300 1400 1500))))
(setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")
(setq org-tags-column -102)
(setq org-habit-graph-column 50)

;; Custom agenda
(setq org-agenda-custom-commands
      (quote (("n" "Notes" tags "NOTE"
               ((org-agenda-overriding-header "Notes")
                (org-tags-match-list-sublevels t)))
              ("g" "Games"
               ((tags "GAME"
                     ((org-agenda-overriding-header "Games")
                      (org-tags-match-list-sublevels t)))
               (tags "GAMEWATCH"
                     ((org-agenda-overriding-header "Games to watch")
                      (org-tags-match-list-sublevels t)))))
              (" " "Agenda"
               ((agenda "" nil)
                (tags "REFILE"
                      ((org-agenda-overriding-header "Tasks to Refile")
                       (org-tags-match-list-sublevels nil)))
                (tags-todo "-HOLD-CANCELLED/!"
                           ((org-agenda-overriding-header "Projects")
                            (org-agenda-skip-function 'shaines1/skip-non-projects)
                            ;; (org-tags-match-list-sublevels 'indented)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
                           ((org-agenda-overriding-header (concat "Project Subtasks"
                                                                  (if shaines1/hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'shaines1/skip-non-project-tasks)
                            (org-agenda-todo-ignore-scheduled shaines1/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines shaines1/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date shaines1/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-REFILE-CANCELLED-WAITING-HOLD-NOTE-GAME/!"
                           ((org-agenda-overriding-header (concat "Standalone Tasks"
                                                                  (if shaines1/hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'shaines1/skip-project-tasks)
                            (org-agenda-todo-ignore-scheduled shaines1/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines shaines1/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date shaines1/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-CANCELLED+WAITING|HOLD/!"
                           ((org-agenda-overriding-header (concat "Waiting and Postponed Tasks"
                                                                  (if shaines1/hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'shaines1/skip-non-tasks)
                            (org-tags-match-list-sublevels nil)
                            (org-agenda-todo-ignore-scheduled shaines1/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines shaines1/hide-scheduled-and-waiting-next-tasks)))
                (tags-todo "LEARNING"
                      ((org-agenda-overriding-header "Stuff to Learn")
                       (org-tags-match-list-sublevels nil))))
               nil))))

;; Agenda Clocking
(setq org-agenda-clock-consistency-checks
      (quote (:max-duration "4:00" :min-duration 0 :max-gap 0 :gap-ok-around ("4:00"))))
(setq org-agenda-skip-additional-timestamps-same-entry t)
(setq org-clock-report-include-clocking-task t)

;; Agenda windowing
(setq org-agenda-window-setup 'current-window)
(setq org-indirect-buffer-display 'current-window)

;; Agenda tag filtering / searching
(setq org-agenda-auto-exclude-function 'shaines1/org-auto-exclude-function)
(setq org-agenda-tags-todo-honor-ignore-options t)

;; General Clocking
(setq org-clock-persist t)
(setq org-clock-in-resume t)
(setq org-clock-out-when-done t)
(setq org-clock-out-remove-zero-time-clocks t)
(setq org-clock-persist-query-resume nil)
(setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
(setq org-clock-in-switch-to-state 'shaines1/clock-in-to-next)

(setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
(setq org-log-into-drawer t)
(setq org-clock-into-drawer t)
(setq org-clock-out-remove-zero-time-clocks t)
(setq org-time-stamp-rounding-minutes (quote (1 1)))
(setq org-log-done (quote time))

;; Tags
(setq org-fast-tag-selection-single-key (quote t))
(setq org-tag-alist (quote (("CANCELLED" . ?c)
                            ("WAITING" . ?w)
                            ("HOLD" . ?h)
                            ("MEETING" . ?m)
                            ("LEARNING" . ?l)
                            ("NOTE" . ?n))))

;; Todo keywords
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "ACTIVE(a)" "REVIEW(r)" "|" "DONE(d)")
              (sequence "TOLEARN(l)" "INVESTIGATING(i)" "|" "LEARNED(e)")
              (sequence "UNPLAYED(u)" "PLAYING(p)" "|" "FINISHED(f)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)")
              (sequence "MEETING(m)" "|" "DONE(d)"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("TOLEARN" :foreground "red" :weight bold)
              ("UNPLAYED" :foreground "red" :weight bold)
              ("ACTIVE" :foreground "blue" :weight bold)
              ("INVESTIGATING" :foreground "blue" :weight bold)
              ("PLAYING" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("LEARNED" :foreground "forest green" :weight bold)
              ("FINISHED" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("ACTIVE" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

;; Capture
(setq org-src-window-setup 'current-window)
(setq org-capture-templates
      (quote (("t" "Todo" entry (file "~/.emacs.d/org/refile.org")
               "* TODO %?\n%U\n" :clock-in t :clock-resume t)
              ("r" "Respond" entry (file "~/.emacs.d/org/refile.org")
               "* ACTIVE Respond to %? \nSCHEDULED: %t\n%U\n" :clock-in t :clock-resume t)
              ("n" "Note" entry (file "~/.emacs.d/org/refile.org")
               "* %? :NOTE:\n%U\n")
              ("l" "Tolearn" entry (file "~/.emacs.d/org/refile.org")
               "* TOLEARN %? :LEARNING:\n%U\n" :clock-in t :clock-resume t)
              ("p" "Toplay" entry (file "~/.emacs.d/org/refile.org")
               "* UNPLAYED %? :GAME:\n%U\n" :clock-in t :clock-resume t)
              ("m" "Meeting" entry (file "~/.emacs.d/org/refile.org")
               "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t))))

;; Editing
(setq org-catch-invisible-edits 'smart)
(setq org-return-follows-link t)
(setq org-yank-adjusted-subtrees t)

;; Miscellaneous
(setq org-stuck-projects (quote ("" nil nil "")))
(setq org-enforce-todo-dependencies t)
(setq org-cycle-separator-lines 0)
(setq org-insert-heading-respect-content nil)
(setq org-special-ctrl-a/e t)
(setq org-special-ctrl-k t)
(setq org-read-date-prefer-future 'time)


;;
;; Hooks
(add-hook 'org-clock-out-hook 'shaines1/remove-empty-drawer-on-clock-out 'append)
(add-hook 'org-clock-out-hook 'shaines1/clock-out-maybe 'append)
(add-hook 'org-finalize-agenda-hook 'shaines1/org-agenda-to-appt 'append)
;; Always hilight the current agenda line
(add-hook 'org-agenda-mode-hook '(lambda () (hl-line-mode 1)) 'append)


;;
;; Functions
; Exclude DONE state tasks from refile targets
(defun shaines1/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(defun shaines1/show-org-agenda ()
  (interactive)
  (switch-to-buffer "*Org Agenda*")
  (delete-other-windows))

(defun shaines1/org-auto-exclude-function (tag)
  "Automatic task exclusion in the agenda with / RET"
  (and (cond
        ((string= tag "HOLD")
         t))
       (concat "-" tag)))

;; Remove empty LOGBOOK drawers on clock out
(defun shaines1/remove-empty-drawer-on-clock-out ()
  (interactive)
  (save-excursion
    (beginning-of-line 0)
    (org-remove-empty-drawer-at "LOGBOOK" (point))))

(defun shaines1/punch-in (arg)
  "Start continuous clocking and set the default task to the
selected task. If no task is selected set the Organization task
as the default task."
  (interactive "p")
  (setq shaines1/keep-clock-running t)
  (if (equal major-mode 'org-agenda-mode)
      ;;
      ;; We're in the agenda
      ;;
      (let* ((marker (org-get-at-bol 'org-hd-marker))
             (tags (org-with-point-at marker (org-get-tags-at))))
        (if (and (eq arg 4) tags)
            (org-agenda-clock-in '(16))
          (shaines1/clock-in-organization-task-as-default)))
    ;;
    ;; We are not in the agenda
    ;;
    (save-restriction
      (widen)
      ; Find the tags on the current task
      (if (and (equal major-mode 'org-mode) (not (org-before-first-heading-p)) (eq arg 4))
          (org-clock-in '(16))
        (shaines1/clock-in-organization-task-as-default)))))

(defun shaines1/punch-out ()
  (interactive)
  (setq shaines1/keep-clock-running nil)
  (when (org-clock-is-active)
    (org-clock-out))
  (org-agenda-remove-restriction-lock))

(defun shaines1/clock-in-to-next (kw)
  "Switch a task from TODO to ACTIVE or TOLEARN to INVESTIGATING when clocking in.
Skips capture tasks, projects, and subprojects."
  (when (not (and (boundp 'org-capture-mode) org-capture-mode))
    (cond
     ((and (member (org-get-todo-state) (list "TODO"))
           (shaines1/is-task-p))
      "ACTIVE")
     ((and (member (org-get-todo-state) (list "TOLEARN"))
           (shaines1/is-task-p))
      "INVESTIGATING"))))

(defun shaines1/clock-in-default-task ()
  (save-excursion
    (org-with-point-at org-clock-default-task
      (org-clock-in))))

(defun shaines1/clock-in-organization-task-as-default ()
  (interactive)
  (org-with-point-at (org-id-find shaines1/organization-task-id 'marker)
    (org-clock-in '(16))))

(defun shaines1/clock-in-lunch-task ()
  (interactive)
  (org-with-point-at (org-id-find shaines1/lunch-task-id 'marker)
    (org-clock-in '(16))))

(defun shaines1/clock-in-parent-task ()
  "Move point to the parent (project) task if any and clock in"
  (let ((parent-task))
    (save-excursion
      (save-restriction
        (widen)
        (while (and (not parent-task) (org-up-heading-safe))
          (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
            (setq parent-task (point))))
        (if parent-task
            (org-with-point-at parent-task
              (org-clock-in))
          (when shaines1/keep-clock-running
            (shaines1/clock-in-default-task)))))))

(defun shaines1/clock-in-last-task (arg)
  "Clock in the interrupted task if there is one
Skip the default task and get the next one.
A prefix arg forces clock in of the default task."
  (interactive "p")
  (let ((clock-in-to-task
         (cond
          ((eq arg 4) org-clock-default-task)
          ((and (org-clock-is-active)
                (equal org-clock-default-task (cadr org-clock-history)))
           (caddr org-clock-history))
          ((org-clock-is-active) (cadr org-clock-history))
          ((equal org-clock-default-task (car org-clock-history)) (cadr org-clock-history))
          (t (car org-clock-history)))))
    (widen)
    (org-with-point-at clock-in-to-task
      (org-clock-in nil))))

(defun shaines1/clock-out-maybe ()
  (when (and shaines1/keep-clock-running
             (not org-clock-clocking-in)
             (marker-buffer org-clock-default-task)
             (not org-clock-resolving-clocks-due-to-idleness))
    (shaines1/clock-in-parent-task)))

(defun shaines1/find-project-task ()
  "Move point to the parent (project) task if any"
  (save-restriction
    (widen)
    (let ((parent-task (save-excursion (org-back-to-heading 'invisible-ok) (point))))
      (while (org-up-heading-safe)
        (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
          (setq parent-task (point))))
      (goto-char parent-task)
      parent-task)))

(defun shaines1/is-project-p ()
  "Any task with a todo keyword subtask"
  (save-restriction
    (widen)
    (let ((has-subtask)
          (subtree-end (save-excursion (org-end-of-subtree t)))
          (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
      (save-excursion
        (forward-line 1)
        (while (and (not has-subtask)
                    (< (point) subtree-end)
                    (re-search-forward "^\*+ " subtree-end t))
          (when (member (org-get-todo-state) org-todo-keywords-1)
            (setq has-subtask t))))
      (and is-a-task has-subtask))))

(defun shaines1/is-project-subtree-p ()
  "Any task with a todo keyword that is in a project subtree.
Callers of this function already widen the buffer view."
  (let ((task (save-excursion (org-back-to-heading 'invisible-ok)
                              (point))))
    (save-excursion
      (shaines1/find-project-task)
      (if (equal (point) task)
          nil
        t))))

(defun shaines1/is-task-p ()
  "Any task with a todo keyword and no subtask"
  (save-restriction
    (widen)
    (let ((has-subtask)
          (subtree-end (save-excursion (org-end-of-subtree t)))
          (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
      (save-excursion
        (forward-line 1)
        (while (and (not has-subtask)
                    (< (point) subtree-end)
                    (re-search-forward "^\*+ " subtree-end t))
          (when (member (org-get-todo-state) org-todo-keywords-1)
            (setq has-subtask t))))
      (and is-a-task (not has-subtask)))))

(defun shaines1/is-subproject-p ()
  "Any task which is a subtask of another project"
  (let ((is-subproject)
        (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
    (save-excursion
      (while (and (not is-subproject) (org-up-heading-safe))
        (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
          (setq is-subproject t))))
    (and is-a-task is-subproject)))

(defun shaines1/skip-stuck-projects ()
  "Skip trees that are not stuck projects"
  (save-restriction
    (widen)
    (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
      (if (shaines1/is-project-p)
          (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
                 (has-next ))
            (save-excursion
              (forward-line 1)
              (while (and (not has-next) (< (point) subtree-end) (re-search-forward "^\\*+ NEXT " subtree-end t))
                (unless (member "WAITING" (org-get-tags-at))
                  (setq has-next t))))
            (if has-next
                nil
              next-headline)) ; a stuck project, has subtasks but no next task
        nil))))

(defun shaines1/skip-non-projects ()
  "Skip trees that are not projects"
  (save-restriction
    (widen)
    (let ((subtree-end (save-excursion (org-end-of-subtree t))))
      (cond
       ((shaines1/is-project-p)
        nil)
       ((and (shaines1/is-project-subtree-p) (not (shaines1/is-task-p)))
        nil)
       (t
        subtree-end)))))

(defun shaines1/skip-non-tasks ()
  "Show non-project tasks.
Skip project and sub-project tasks, habits, and project related tasks."
  (save-restriction
    (widen)
    (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
      (cond
       ((shaines1/is-task-p)
        nil)
       (t
        next-headline)))))

(defun shaines1/skip-project-tasks ()
  "Show non-project tasks.
Skip project and sub-project tasks, habits, and project related tasks."
  (save-restriction
    (widen)
    (let* ((subtree-end (save-excursion (org-end-of-subtree t))))
      (cond
       ((shaines1/is-project-p)
        subtree-end)
       ((org-is-habit-p)
        subtree-end)
       ((shaines1/is-project-subtree-p)
        subtree-end)
       (t
        nil)))))

(defun shaines1/skip-non-project-tasks ()
  "Show project tasks.
Skip project and sub-project tasks, habits, and loose non-project tasks."
  (save-restriction
    (widen)
    (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
           (next-headline (save-excursion (or (outline-next-heading) (point-max)))))
      (cond
       ((shaines1/is-project-p)
        next-headline)
       ((org-is-habit-p)
        subtree-end)
       ((and (shaines1/is-project-subtree-p)
             (member (org-get-todo-state) (list "ACTIVE")))
        subtree-end)
       ((not (shaines1/is-project-subtree-p))
        subtree-end)
       (t
        nil)))))

(defun shaines1/skip-projects-and-habits ()
  "Skip trees that are projects and tasks that are habits"
  (save-restriction
    (widen)
    (let ((subtree-end (save-excursion (org-end-of-subtree t))))
      (cond
       ((shaines1/is-project-p)
        subtree-end)
       ((org-is-habit-p)
        subtree-end)
       (t
        nil)))))

(defun shaines1/skip-non-subprojects ()
  "Skip trees that are not projects"
  (let ((next-headline (save-excursion (outline-next-heading))))
    (if (shaines1/is-subproject-p)
        nil
      next-headline)))

(defun shaines1-org-clocktable-indent-string (level)
  (if (= level 1)
      ""
    (let ((str "."))
      (while (> level 2)
        (setq level (1- level)
              str (concat str "..")))
      (concat str ".. "))))
(advice-add 'org-clocktable-indent-string :override #'shaines1-org-clocktable-indent-string)

; Erase all reminders and rebuilt reminders for today from the agenda
(defun shaines1/org-agenda-to-appt ()
  (interactive)
  (setq appt-time-msg-list nil)
  (org-agenda-to-appt))


;;
;; Post-settings function calls
;; Resume clocking task when emacs is restarted
(shaines1/org-agenda-to-appt)

; Activate appointments so we get notifications
(appt-activate t)

(provide 'shaines1-org)
;;; shaines1-org.el ends here
