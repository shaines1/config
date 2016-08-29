;;; shaines1-keys.el --- Key remappings              -*- lexical-binding: t; -*-

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
(message "shaines1 - Creating custom key bindings...")

;; movement
(global-set-key (kbd "M-o") 'forward-char)
(global-set-key (kbd "M-u") 'backward-char)
(global-set-key (kbd "M-l") 'forward-word)
(global-set-key (kbd "M-j") 'backward-word)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "C-;") 'goto-line)
(global-set-key [remap move-beginning-of-line] 'shaines1/move-beginning-of-line)

;; editing
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-q") 'kmacro-call-macro)

;; regexp
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "M-%") 'query-replace-regexp)

;; buffers
(global-set-key (kbd "C-M-u") (lambda () (interactive) (other-window -1 "visible")))
(global-set-key (kbd "C-M-o") (lambda () (interactive) (other-window 1 "visible")))
(global-set-key (kbd "M-q") 'revert-buffer)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "<f9> s") 'shaines1/switch-to-scratch)

;; bookmarks
(global-set-key (kbd "<C-f6>") '(lambda () (interactive) (bookmark-set "SAVED")))
(global-set-key (kbd "<f6>") '(lambda () (interactive) (bookmark-jump "SAVED")))


(provide 'shaines1-keys)
;;; shaines1-keys.el ends here
