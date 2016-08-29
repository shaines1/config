;;; shaines1-help.el --- Configuration for help major mode  -*- lexical-binding: t; -*-

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
(message "shaines1 - Configuring help major mode...")

(add-hook 'help-mode-hook
          (lambda ()
            (define-key help-mode-map "n" 'forward-button)
            (define-key help-mode-map "p" 'backward-button)
            (define-key help-mode-map (kbd "M-u") 'help-go-back)
            (define-key help-mode-map (kbd "M-o") 'help-go-forward)))

(provide 'shaines1-help)
;;; shaines1-help.el ends here
