;;; shaines1-minor-modes.el --- Configuration for minor modes  -*- lexical-binding: t; -*-

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

;;

;;; Code:
(message "shaines1 - Enabling minor modes...")

;;
;; abbrev-mode
(abbrev-mode t)


;;
;; auto-insert mode
(auto-insert-mode t)

;; Never query
(setq auto-insert-query nil)

;; Directory containing insert files
(setq auto-insert-directory "~/.emacs.d/insert/")


;;
;; auto-revert mode
(global-auto-revert-mode t)


;;
;; ido mode
(ido-mode t)
(setq ido-create-new-buffer (quote never))
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)


;;
;; recentf mode
(recentf-mode t)
(setq recentf-max-saved-items 200)
(global-set-key (kbd "C-x C-r") 'recentf-ido-find-file)


;;
;; show-paren mode
(show-paren-mode t)


;;
;; winner
(winner-mode t)

(provide 'shaines1-minor-modes)
;;; shaines1-minor-modes.el ends here
