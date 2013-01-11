;;; A package manager
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(setq my:el-get-packages
      '(color-theme
        color-theme-solarized
        rope
        ropemacs
        ropemode
        ))				
 
(el-get 'sync my:el-get-packages)





;;; Gestionnaire de package
;;;(require 'package)
;;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;;;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages") t)
;;;(package-initialize)

(color-theme-solarized-dark)

;;; Indentation
(setq-default indent-tabs-mode nil)    ; use only spaces and no tabs
(setq default-tab-width 4)
