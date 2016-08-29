;;; shaines1-packages.el --- Package configuration   -*- lexical-binding: t; -*-

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
(message "shaines1 - Initializing packages...")

;;
;; initialize packages
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

;; activate all the packages (in particular autoloads)
(package-initialize)

;;
;; initialize use-package
(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

(require 'use-package)


;;
;; install packages
;; beacon
(use-package beacon
  :diminish beacon-mode
  :config
  (beacon-mode t)
  (setq beacon-color "dark slate gray")
  (setq beacon-dont-blink-commands
   (quote
    (next-line previous-line forward-line recenter-top-bottom mwheel-scroll))))

;; ido
(use-package ido-ubiquitous
  :config
  (ido-ubiquitous-mode t))

(use-package ido-vertical-mode
  :config
  (ido-vertical-mode 1)
  (define-key ido-common-completion-map (kbd "C-j") 'ido-up-directory))


;; smex
(use-package smex
  :config
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands))


;; whitespace
(use-package whitespace
  :diminish global-whitespace-mode
  :config
  (global-whitespace-mode t)

  ;; Automatically cleanup whitespace
  (setq whitespace-action '(auto-cleanup))

  ;; Enable whitespace detetion for trailing space, empty lines,
  ;; and improper indentation
  (setq whitespace-style '(face trailing empty indentation)))


(provide 'shaines1-packages)
;;; shaines1-packages.el ends here
