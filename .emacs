(setq-default indent-tabs-mode t)
(setq-default tab-width 3)
(setq indent-line-function 'insert-tab)(fset 'newline-down
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("OBOA" 0 "%d")) arg)))

(fset 'newline-downTab
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("OA	" 0 "%d")) arg)))


(fset 'newline-above
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("OA" 0 "%d")) arg)))


;;Newline-Below
(global-set-key (kbd "M-s d")
                'newline-down)

;;Newline-Above
(global-set-key (kbd "M-s u")
                'newline-above)

;;Delete Selection mode to true
(delete-selection-mode 1)

;;Set mark Command
(global-set-key (kbd "M-s M-s")
                'set-mark-command)

;;Control Shift Up
(define-key input-decode-map "[1;2A" [S-up])

;;Newline below + cursor tab in middle
(global-set-key (kbd "M-s t")
                'newline-downTab)

;;Java mode tabwidth
(add-hook 'java-mode-hook (lambda ()
                                (setq c-basic-offset 3)))
;;Reading other java files
(add-hook 'java-mode-hook (lambda ()
                                (setq c-basic-offset 3
                                      tab-width 3
                                      indent-tabs-mode 1)))
;Java newline-and-indent
(add-hook 'java-mode-hook (lambda ()
											(local-set-key
											 (kbd "RET") 'newline-and-indent)))

;;Mouse mode
(xterm-mouse-mode)

;;Autocomplete mode
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)
(setq ac-ignore-case nil)
(global-auto-composition-mode t)

;;JDEE
;;cmt(add-to-list 'load-path "~/.emacs.d/jdee-2.4.1/lisp")
;;cmt(load "jde")
;;cmt(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;cmt'(auto-save-visited-file-name nil)
 ;;cmt'(backward-delete-char-untabify-method nil)
 ;;cmt'(global-linum-mode t)
 ;;cmt'(jde-complete-function (quote jde-complete-menu))
 ;;cmt'(jde-electric-return-p t)
 ;;cmt'(jde-enable-abbrev-mode t)
 ;;cmt'(jde-jdk (quote ("1.6.0")))
 ;;cmt'(jde-jdk-registry (quote (("1.6.0" . "$JAVA_HOME")))))
;;cmt(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;cmt)

;;Set color theme
;(set-background-color "#524F52") ;vormator magenta
(set-background-color "#2C2C2A") ;warm black
(set-foreground-color "white")


;;Yasnippet
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.8.0")
(require 'yasnippet)
;;(yas/initialize)
(yas/load-directory "~/.emacs.d/elpa/yasnippet-0.8.0/snippets/text-mode")
(add-to-list 'ac-sources 'ac-sources-yasnippet)

;;Javascript mode js2-mode
;(autoload 'js2-mode "js2" nil t)
;(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;(electric-pair-mode t)
;(electric-layout-mode t)

;(electric-indent-mode +1)


;------------------
;(global-set-key (kbd "{ r")
 ;               'newline-and-indent)

;cmode indent?
(setq c-default-style "linux"
          c-basic-offset 3)
;(c-toggle-auto-newline)
(add-hook 'c-mode-common-hook
			 (lambda () (c-toggle-auto-newline t)))

;Auto save
(auto-save-mode -3)
;Modified buffer
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (flet ((process-list ())) ad-do-it))


;;Ruby mode
(add-to-list 'load-path "~/.emacs.d/ruby-mode/")
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(autoload 'ruby-mode "ruby-mode" "Major mode for editing Ruby code" t)
(add-hook 'ruby-mode-hook (lambda () (local-set-key "\r" 'newline-and-indent)))
(require 'inf-ruby)
(require 'ruby-electric)
(add-hook 'ruby-mode-hook (lambda () (ruby-electric-mode t)))
(add-hook 'ruby-mode-hook (lambda ()
											(local-set-key
											 (kbd "C-c C-l") 'run-ruby)))
(add-hook 'ruby-mode-hook (lambda ()
											(local-set-key
											 (kbd "BACKSPACE") 'delete-backward-char)))
;;(add-hook 'ruby-mode-hook (lambda ()
;									 (setq delete-selection-mode +1)))

;; select line macro
(fset 'select_line
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("\363\363" 0 "%d")) arg)))

(global-set-key (kbd "M-s M-a")
                'select_line)
;;white space ruby mode
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'ruby-mode-hook (lambda ()
                            (setq show-trailing-whitespace nil)))

;; Erlang Emacs mode
(setq erlang-root-dir "/usr/lib/erlang")
(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
(require 'erlang-start)
