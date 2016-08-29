(deftheme shaines1
  "Dark matrix theme")

(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

(custom-theme-set-faces
 'shaines1
 '(font-lock-comment-face ((t (:foreground "firebrick"))))
 '(cursor ((t (:background "green"))))
 '(default ((t (:background "Black" :foreground "Green" :slant normal :weight normal :height 98 :width normal :foundry "outline" :family "DejaVu Sans Mono"))))
 '(region ((t (:background "gray9")))))

(provide-theme 'shaines1)
