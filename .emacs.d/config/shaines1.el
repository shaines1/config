;;; shaines1.el --- Top level Emacs configuration   -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Shaine Strullmyer

;; Author: Shaine Strullmyer <shaines1@gmail.com>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTAnnBILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:
(message "shaines1 - Applying configuration...")

(setq user-full-name "Shaine Strullmyer")
(setq user-mail-address "shaines1@gmail.com")

;; Pull in the components
(require 'shaines1-aliases)
(require 'shaines1-custom)
(require 'shaines1-defuns)
(require 'shaines1-hooks)
(require 'shaines1-keys)
(require 'shaines1-minor-modes)
(require 'shaines1-packages)
(require 'shaines1-org)

;; Major mode components
(require 'shaines1-help)

;; Load theme
(load-theme 'shaines1)

;; Load override keys
(require 'shaines1-keys-minor-mode)

(provide 'shaines1)
;;; shaines1.el ends here
