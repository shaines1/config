;;; shaines1-keys-minor-mode.el --- shaines1 global override keys  -*- lexical-binding: t; -*-

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
(defvar shaines1-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-j") 'backward-kill-word)
    map)
  "shaines1-keys-minor-mode keymap")

(define-minor-mode shaines1-keys-minor-mode
  "Minor mode for overriding key bindings globally"
  :init-value t
  :lighter "")

(shaines1-keys-minor-mode 1)

(provide 'shaines1-keys-minor-mode)
;;; shaines1-keys-minor-mode.el ends here
