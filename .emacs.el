;; Package manageur

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))


;; Liste des paquets
(setq my:el-get-packages
      '(virtualenv
        magit
        auto-complete
        yasnippet
        pymacs
        rope
        ropemode
        ropemacs
        flymake
        flymake-cursor
        python-pep8
        nxhtml
        color-theme
        color-theme-solarized
        graphviz-dot-mode
        ))				

(el-get 'sync my:el-get-packages)
;(el-get 'sync)

;; Redefinition des touches
(global-set-key [ (control c) (control g) ] 'goto-line);; Aller a la ligne / C-c C-g

;; Options globales
(exit-splash-screen) ;; Pas d'ecran de demarage
(global-linum-mode t);; Numerotation des lignes
(cua-mode t) ;; Activation des racourcis couper/copier/coller
(yas-global-mode t)  ;; Active le mode yasnippet
(ido-mode t) ;; Ameliore la recherche buffer, fichier, repertoire
(color-theme-solarized-dark) ;; Theme Solarizd
(transient-mark-mode t) ;; Active/Affiche la selection, pour commenter du code avec M-;
(show-paren-mode t) ;; Affiche les parentheses
;;(flymake-mode t) ;; Activate flymake mode
;;(flymake-cursor-mode t) ;; Activate flymake cursor mode

;; Completion du code
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Python (src: www.enigmacurry.com)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Pymacs (python 2.7)
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

;; Rope
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

;;flymake
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pycheckers"  (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))

;;; Indentation
(setq-default indent-tabs-mode nil)    ; use only spaces and no tabs
(setq default-tab-width 4)
