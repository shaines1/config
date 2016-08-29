;;; shaines1-aliases.el --- Function aliases         -*- lexical-binding: t; -*-

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
(message "shaines1 - Setting aliases...")

;;
;; Rename functions
;; make frequently used commands short
(defalias 'cg 'customize-group)
(defalias 'dml 'delete-matching-lines)
(defalias 'dnml 'delete-non-matching-lines)
(defalias 'er 'eval-region)


;;
;; Override functions
(defalias 'list-buffers 'ibuffer)


(provide 'shaines1-aliases)
;;; shaines1-aliases.el ends here
