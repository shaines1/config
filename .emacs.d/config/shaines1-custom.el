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

;;; Commentary: Place for all the configuration changes I've yet
;; to file away

;;

;;; Code:
(message "shaines1 - Calling custom-set functions...")

;; Misc??
(fset 'yes-or-no-p 'y-or-n-p)

(setq custom-file "~/.emacs.d/config/shaines1-custom.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(apropos-do-all t)
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(calendar-bahai-all-holidays-flag nil)
 '(calendar-christian-all-holidays-flag t)
 '(calendar-holidays
   (quote
    ((holiday-fixed 1 1 "New Year's Day")
     (holiday-float 1 1 3 "Martin Luther King Day")
     (holiday-fixed 2 2 "Groundhog Day")
     (holiday-fixed 2 14 "Valentine's Day")
     (holiday-float 2 1 3 "President's Day")
     (holiday-fixed 3 17 "St. Patrick's Day")
     (holiday-fixed 4 1 "April Fools' Day")
     (holiday-float 5 0 2 "Mother's Day")
     (holiday-float 5 1 -1 "Memorial Day")
     (holiday-fixed 6 14 "Flag Day")
     (holiday-float 6 0 3 "Father's Day")
     (holiday-fixed 7 4 "Independence Day")
     (holiday-float 9 1 1 "Labor Day")
     (holiday-float 10 1 2 "Columbus Day")
     (holiday-fixed 10 31 "Halloween")
     (holiday-fixed 11 11 "Veteran's Day")
     (holiday-float 11 4 4 "Thanksgiving")
     (holiday-easter-etc)
     (holiday-fixed 12 25 "Christmas")
     (if calendar-christian-all-holidays-flag
         (append
          (holiday-fixed 1 6 "Epiphany")
          (holiday-julian 12 25 "Christmas (Julian calendar)")
          (holiday-advent 0 "Advent")))
     (solar-equinoxes-solstices)
     (holiday-sexp calendar-daylight-savings-starts
                   (format "Daylight Saving Time Begins %s"
                           (solar-time-string
                            (/ calendar-daylight-savings-starts-time
                               (float 60))
                            calendar-standard-time-zone-name)))
     (holiday-sexp calendar-daylight-savings-ends
                   (format "Daylight Saving Time Ends %s"
                           (solar-time-string
                            (/ calendar-daylight-savings-ends-time
                               (float 60))
                            calendar-daylight-time-zone-name))))))
 '(calendar-mark-holidays-flag t)
  '(confirm-nonexistent-file-or-buffer nil)
 '(custom-safe-themes
   (quote
    ("893708ac62e034e4ef5640a6d012ba7497f813502dc2423fb0f23d147181258f" "04d04c7f89a368158f59e4c27d2cfc043a2801e5120e967eae8a0ccf5608e4c1" "e3f9492011d7a17b198100298eb02fcd6f4772b350d04c2c1ab881b31511dc24" default)))
 '(custom-theme-directory "~/.emacs.d/themes")
 '(delete-old-versions t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(initial-scratch-message nil)
 '(require-final-newline t)
 '(revert-without-query (quote (".*")))
 '(standard-indent 3)
 '(tab-width 3)
 '(verilog-case-indent 3)
 '(vhdl-basic-offset 4)
 '(vhdl-intelligent-tab nil)
 '(visible-bell t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:foreground "red"))))
 '(org-level-2 ((t (:foreground "orange"))))
 '(org-level-3 ((t (:foreground "yellow"))))
 '(org-level-4 ((t (:foreground "green"))))
 '(org-level-5 ((t (:foreground "dodger blue"))))
 '(org-level-6 ((t (:foreground "purple"))))
  '(org-mode-line-clock ((t (:foreground "red" :box (:line-width -1 :style released-button)))) t)
 '(whitespace-indentation ((t nil))))


(provide 'shaines1-custom)
;;; shaines1-custom.el ends here
