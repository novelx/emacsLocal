;; -*-Emacs-Lisp-*-

;;------------------------------------------------
;;         GLOBAL SETTINGS
;;------------------------------------------------

;; set personal information
(setq user-full-name "LI Xiaohan")
(setq user-mail-address "xiaohan.li@gmail.com")

;; set default coding system for saving text files
;;(setq default-buffer-file-coding-system 'utf-8)

;; set load paths
;;(add-to-list 'load-path "c:/green/emacs-22.3/lisp/international")
;;(add-to-list 'load-path "c:/green/emacs-22.3/lisp/textmodes")
;;(add-to-list 'load-path "c:/green/emacs-22.3/lisp/progmodes")
;;(add-to-list 'load-path "c:/green/emacs-22.3/lisp/emacs-lisp")
;;(add-to-list 'load-path "~/.emacs.d/elisp")

;;-----------------------------------------------
;;	Common key bindings
;;-----------------------------------------------

;; Meta
(global-set-key (kbd "C-<f4>") 'kill-buffer-and-window)
(global-set-key (kbd "<f5>") 'dired)
(global-set-key (kbd "C-<f5>") 'switch-to-buffer)
;; pop mark
(global-set-key (kbd "C-,") "\C-u\C-@")

;;(global-set-key (kbd "C-,") 'highlight-changes-previous-change)
;;(global-set-key (kbd "C-.") 'highlight-changes-next-change)

;;(global-set-key (kbd "C-<f1>") 'compile)
;;(global-set-key (kbd "C-<f2>") 'grep)
;;(global-set-key (kbd "C-<f3>") 'next-error)
;;(global-set-key (kbd "C-<f4>") 'previous-error)
;;(global-set-key (kbd "C-<f5>") 'display-faces)
;;(global-set-key (kbd "C-<f8>") 'dired)
;;(global-set-key (kbd "C-<f10>") 'kill-compilation)

;; Keypad bindings
(global-set-key (kbd "<up>") "\C-p")
(global-set-key (kbd "<down>") "\C-n")
(global-set-key (kbd "<left>") "\C-b")
(global-set-key (kbd "<right>") "\C-f")
(global-set-key (kbd "<home>") "\C-a")
(global-set-key (kbd "<end>") "\C-e")
(global-set-key (kbd "<prior>") "\M-v")
(global-set-key (kbd "<next>") "\C-v")
(global-set-key (kbd "C-<up>") "\M-\C-b")
(global-set-key (kbd "C-<down>") "\M-\C-f")
(global-set-key (kbd "C-<left>") "\M-b")
(global-set-key (kbd "C-<right>") "\M-f")
(global-set-key (kbd "C-<home>") "\M-<")
(global-set-key (kbd "C-<end>") "\M->")

;; Mouse
(global-set-key [mouse-3] 'imenu)

;; Misc
(global-set-key (kbd "C-<tab>") "\C-q\t")   ; Control tab quotes a tab.
(setq backup-by-copying-when-mismatch t)

;; Treat 'y' or <CR> as yes, 'n' as no.
(fset 'yes-or-no-p 'y-or-n-p)
(define-key query-replace-map [return] 'act)
(define-key query-replace-map [?\C-m] 'act)

;;-----------------------------------------------------
;;         CEDET
;;-----------------------------------------------------

(add-to-list 'load-path "~/.emacs.d/elisp/cedet-1.0pre6/common")
(add-to-list 'load-path "~/.emacs.d/elisp/cedet-1.0pre6/eieio")
(add-to-list 'load-path "~/.emacs.d/elisp/cedet-1.0pre6/semantic")
(add-to-list 'load-path "~/.emacs.d/elisp/cedet-1.0pre6/speedbar")
;;(require 'semantic)
;;(require 'eieio)
;;(require 'speedbar)
;;(require 'cedet)
;;(load-file "~/cedet-1.0pre6/common/cedet.el")
;;(global-semantic-idle-scheduler-mode 1) ;The idle scheduler with automatically reparse buffers in idle time.
;;(global-semantic-idle-completions-mode 1) ;Display a tooltip with a list of possible completions near the cursor.
;;(global-semantic-idle-summary-mode 1) ;Display a tag summary of the lexical token under the cursor.
;;(setq speedbar-update-speed 3)

;; set system include directory
;;(eval-after-load "semantic-c" 
;;  '(dolist (d (list ""))
;;	 (semantic-add-system-include d)))
;;
;;(setq semanticdb-default-save-directory
;;	  (expand-file-name "~/.emacs.d/semanticdb"))

;;-----------------------------------------------------
;;	Language highliting and tidy
;;-----------------------------------------------------

;; ;; C++ and C mode...

;; Temporarily removed, using CEDET instead
;; ;; use hippie-expand instead of poor 'M-/'
;; (global-set-key (kbd "M-/") 'hippie-expand)
;; (setq hippie-expand-try-functions-list
;;       '(try-expand-dabbrev
;; 	try-expand-dabbrev-visible
;; 	try-expand-dabbrev-all-buffers
;; 	try-expand-dabbrev-from-kill
;; 	try-complete-file-name-partially
;; 	try-complete-file-name
;; 	try-expand-all-abbrevs
;; 	try-expand-list
;; 	try-expand-line
;; 	try-complete-lisp-symbol-partially
;; 	try-complete-lisp-symbol))

(add-hook 'c-mode-common-hook 
  '(lambda()
	 (c-set-style "K&R")	;; put at the most begining, this allows following customization
	 (setq tab-width 4)
	 (setq c-basic-offset 4)
	 (setq c-indent-level 4)
	 (setq c-continued-statement-offset 4)
   
	 (require 'cedet)
	 (require 'semantic-ia)
	 (ede-minor-mode t)
	 ;; (global-ede-mode 1)
	 ;; (semantic-load-enable-minimum-features)
	 ;; (semantic-load-enable-code-helpers)
	 ;; (semantic-load-enable-gaudy-code-helpers)
	 (semantic-load-enable-excessive-code-helpers)
	 (local-set-key (kbd "M-/") 'semantic-ia-complete-symbol-menu)
	 (local-set-key "." 'semantic-complete-self-insert)
	 (local-set-key ">" 'semantic-complete-self-insert)
	 ;;(c-toggle-auto-hungry-state 1)
	 )
  )

(defun my-c++-mode-hook ()
  (define-key c++-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (define-key c++-mode-map "\r" 'reindent-then-newline-and-indent)
  (define-key c++-mode-map "\C-ce" 'c-comment-edit)
  (setq c++-auto-hungry-initial-state 'none)
  (setq c++-delete-function 'backward-delete-char)
  (setq c++-tab-always-indent nil)
  (setq c++-empty-arglist-indent 4)
  )

(defun my-c-mode-hook ()
  (define-key c-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (define-key c-mode-map "\r" 'reindent-then-newline-and-indent)
  (define-key c-mode-map "\C-ce" 'c-comment-edit)
  (setq c-auto-hungry-initial-state 'none)
;; this line makes C-d deletes backward
;;  (setq c-delete-function 'backward-delete-char)
  (setq c-tab-always-indent nil)
;; BSD-ish indentation style
  (setq c-brace-offset -4)
  (setq c-argdecl-indent 0)
  (setq c-label-offset -4)
  )

;; ;; Perl mode
(defun my-perl-mode-hook ()
  (setq tab-width 4)
  (define-key perl-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (define-key perl-mode-map "\r" 'newline-and-indent)
  (setq perl-indent-level 4)
  (setq perl-continued-statement-offset 4)
  )

;; ;; Python mode
(defun my-python-mode-hook()
  (setq tab-width 4)
  (define-key python-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (define-key python-mode-map "\r" 'newline-and-indent)
  (require 'cedet)
  (require 'semantic-ia)
  (ede-minor-mode t)
  (semantic-load-enable-excessive-code-helpers)
  (local-set-key (kbd "M-/") 'semantic-ia-complete-symbol-menu)
  (local-set-key "." 'semantic-complete-self-insert)
  )

;; ;; Scheme mode...
(defun my-scheme-mode-hook ()
  (define-key scheme-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (define-key scheme-mode-map "\r" 'newline-and-indent)
  )

;; ;; Emacs-Lisp mode...
(defun my-lisp-mode-hook ()
  (define-key lisp-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (define-key lisp-mode-map "\r" 'newline-and-indent)
;; 'TAB' doesn the same thing
  (define-key lisp-mode-map "\C-i" 'lisp-indent-line)
  (define-key lisp-mode-map "\C-j" 'eval-print-last-sexp)
  )

;; ;; Add all of the hooks...
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'scheme-mode-hook 'my-scheme-mode-hook)
(add-hook 'emacs-lisp-mode-hook 'my-lisp-mode-hook)
(add-hook 'lisp-mode-hook 'my-lisp-mode-hook)
(add-hook 'perl-mode-hook 'my-perl-mode-hook)
(add-hook 'python-mode-hook 'my-python-mode-hook)

;; Auto-fill-mode for text
(add-hook 'text-mode-hook 'auto-fill-function)

;;-----------------------------------------------------
;;       DOXYMACS
;;-----------------------------------------------------

(add-to-list 'load-path "~/.emacs.d/elisp/doxymacs-1.8.0/lisp")
(require 'doxymacs)
(add-hook 'c-mode-common-hook 'doxymacs-mode)
(defun my-doxymacs-font-lock-hook ()
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
      (doxymacs-font-lock)))
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)


;;-----------------------------------------------------
;;         CSCOPE
;;-----------------------------------------------------

(require 'compile)
(require 'easymenu)
(add-to-list 'load-path "~/.emacs.d/elisp/xcscope")
(require 'xcscope)

(global-set-key (kbd "S-<f5>") 'cscope-tell-user-about-directory)
(global-set-key (kbd "<f7>") 'cscope-display-buffer)
(global-set-key (kbd "S-<f7>") 'cscope-display-buffer-toggle)
(global-set-key (kbd "<f8>") 'cscope-next-symbol)
(global-set-key (kbd "S-<f8>") 'cscope-prev-symbol)
(global-set-key (kbd "C-=") 'cscope-find-global-definition-no-prompting)
(global-set-key (kbd "C--") 'cscope-pop-mark)


;;-----------------------------------------------------
;;         JDE & ELIB
;;-----------------------------------------------------

;; prepare the paths for JDE
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp/jde-2.4.0/lisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp/cedet-1.0pre6/common"))
(load-file (expand-file-name "~/.emacs.d/elisp/cedet-1.0pre6/common/cedet.el"))
(add-to-list 'load-path "~/.emacs.d/elisp/elib-1.0")

;; If you want Emacs to defer loading the JDE until you open a
;; Java file, edit the following line
;; (setq defer-loading-jde nil)
;; to read:
;;
(setq defer-loading-jde t)
;;
(if defer-loading-jde
    (progn
      (autoload 'jde-mode "jde" "JDE mode." t)
      (setq auto-mode-alist
	    (append
	     '(("\\.java\\'" . jde-mode))
	     auto-mode-alist)))
	(require 'jde))

;; Sets the basic indentation for Java source files
;; to two spaces.
(defun my-jde-mode-hook ()
  (setq c-basic-offset 4)
  (setq tab-width 4)
  (define-key java-mode-map "\C-m" 'reindent-then-newline-and-indent))

(add-hook 'jde-mode-hook 'my-jde-mode-hook)

;; auto complete?
;; (setq jde-enable-abbrev-mode t)

;;-----------------------------------------------------
;;         ECB
;;-----------------------------------------------------

(add-to-list 'load-path "~/.emacs.d/elisp/ecb-2.40")
(require 'ecb)
(setq ecb-auto-compatibility-check nil)
(setq ecb-layout-name "xhli-am")
(setq ecb-history-make-buckets 'never)
(setq ecb-windows-width 0.3)
(setq ecb-tip-of-the-day nil)
(defun my-speedbar-auto-update-hook ()
  (setq speedbar-update-flag 1))
(add-hook 'ecb-activate-hook 'my-speedbar-auto-update-hook)
;;(ecb-activate)

(global-set-key (kbd "<f6>") 'ecb-toggle-ecb-windows)
(global-set-key (kbd "S-<f6>") 'ecb-activate)

;;-----------------------------------------------------
;;     FLEX & MXML
;;-----------------------------------------------------

;;(load-file "~/.emacs.d/mxml/ani-fcsh.el")

;;-----------------------------------------------------
;;	Windows Only
;;-----------------------------------------------------

;; ;; Start emacs server for context menu editing
(require 'server)
(when (and (= emacs-major-version 23) (equal window-system 'w32))
  (defun server-ensure-safe-dir (dir) "Noop" t)) ; Suppress error "directory
                                                 ; ~/.emacs.d/server is unsafe"
                                                 ; on windows.
(server-start)
;; ;; The following functions defines the maximize/minimum/restore 
;; ;; functionalities of the window
(defun emacs-maximize ()
 "Maximize emacs window in windows os"
 (interactive)
 (w32-send-sys-command 61488))        ;; WM_SYSCOMMAND #xf030 maximize
(defun emacs-minimize ()
  "Minimize emacs window in windows os"
  (interactive)
  (w32-send-sys-command #xf020))   ;; #xf020 minimize
(defun emacs-restore ()
  "Normal emacs window in windows os"
  (interactive)
  (w32-send-sys-command #xf120))    ;; #xf120 normalimize

;;(emacs-maximize)
(global-set-key (kbd "S-<f9>") 'emacs-minimize)
(global-set-key (kbd "S-<f10>") 'emacs-restore)
(global-set-key (kbd "S-<f11>") 'emacs-maximize)

;; Set the cursor in the middle of the page when scrolling.
;; Good for smooth-scrolling
(defun chb-page-down ()
  (interactive)
  (when (featurep 'xemacs) (setq zmacs-region-stays t))
  (forward-line
   (- (if (fboundp 'window-displayed-height)      ;XEmacs
          (window-displayed-height)
        (window-text-height))                     ;GNUEmacs
      next-screen-context-lines)))

(defun chb-page-up ()
  (interactive)
  (when (featurep 'xemacs) (setq zmacs-region-stays t))
  (forward-line
   (- (- (if (fboundp 'window-displayed-height)   ;XEmacs
             (window-displayed-height)
           (window-text-height))                  ;GNUEmacs
	 next-screen-context-lines))))

(global-set-key (kbd "C-v") 'chb-page-down)
(global-set-key (kbd "M-v") 'chb-page-up)

;;-----------------------------------------------------
;;	MISC
;;-----------------------------------------------------

(add-to-list 'load-path "~/.emacs.d/elisp/misc")

;; no backups (*.*~)
(setq make-backup-files nil)
;; no beeps
(setq visible-bell t)
;; column width in auto-fill-mode
(setq default-fill-column 80)
;; yank at cursor when using mouse
(setq mouse-yank-at-point t)
;; display the column number
(setq column-number-mode t)
;; default tab-stop ;; also defined in 'custom-set-variables' section
(setq tab-width 4)
;; define sentence ends (removed after upgrade to emacs-23.1)
;;(setq sentence-end
;;	 "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
;;(setq sentence-end-double-space nil)	;; support Chinese punctuations in auto-fill mode

;; disable the 'welcome' window at startup
(setq inhibit-startup-message t)

(if (boundp 'w32-quote-process-args)
  (setq w32-quote-process-args ?\")) ;; Include only for MS Windows.

;; ;; IBuffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; ;; IDO
;; "C-x C-f" to activate ido, then
;;   C-s or C-r to rotate the candidate lists
;;   C-k to delete a file
;;   C-j to new a file
;;   C-b to switch to buffer mode
;; "C-x b" to switch between buffers
(require 'ido)
(ido-mode t)

;; ;; Buffer Tabs
(require 'tabbar)
(tabbar-mode)
(global-set-key (kbd "M-<up>") 'tabbar-backward-group)
(global-set-key (kbd "M-<down>") 'tabbar-forward-group)
(global-set-key (kbd "M-<left>") 'tabbar-backward)
(global-set-key (kbd "M-<right>") 'tabbar-forward)

;; ;; Latest buffer fast switching ('tabbar' does the same thing)
(require 'swbuff)
(global-set-key (kbd "C-<prior>") 'swbuff-switch-to-previous-buffer)
(global-set-key (kbd "C-<next>") 'swbuff-switch-to-next-buffer)
(setq swbuff-exclude-buffer-regexps
     '("^ " "\\*.*\\*"))

(setq swbuff-status-window-layout 'scroll)
(setq swbuff-clear-delay 1)
(setq swbuff-separator "|")
(setq swbuff-window-min-text-height 1)

;; ;; Scroll the window when the cursor move up/down 'smooth-scroll-margin'
;; ;; lines to the margin
(require 'smooth-scrolling)
(setq smooth-scroll-margin 3)

;; ;; MISC settings
(transient-mark-mode 1)
(setq mark-even-if-inactive t)
(setq next-line-add-newlines nil)
(setq compile-command "make")
(setq suggest-key-bindings nil)
(put 'eval-expression 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(if (>= emacs-major-version 21)
    (setq show-trailing-whitespace t))


;;-----------------------------------------------------
;;     History RELATED
;;-----------------------------------------------------

;; ;; Session & Desktop
(add-to-list 'load-path "~/.emacs.d/elisp/session/lisp")
(require 'desktop)
(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(setq desktop-globals-to-save '(desktop-missing-file-warning))
;; Set auto-save desktop
(desktop-save-mode 1)
;; Restore the "desktop" - do this as late as possible
(desktop-load-default)
;; Use both "desktop-load-default" and "desktop-read" may genrate a warning messsage
;;(desktop-read)

;; ;; Recent files
;;(require 'recentf)
;;(recentf-mode 1)

;; MS Windows 环境下字体设置
(setq default-frame-alist
(append
  '((font . "fontset-chinese")) default-frame-alist))

(create-fontset-from-fontset-spec
  "-outline-Courier New-normal-r-normal-normal-13-97-96-96-c-*-fontset-chinese")
(set-fontset-font
 "fontset-default" nil
 "-outline-宋体-normal-r-normal-normal-14-*-96-96-c-*-iso10646-1" nil 'prepend)
(set-fontset-font
 "fontset-chinese" 'kana
 "-outline-宋体-normal-r-normal-normal-14-*-96-96-c-*-iso10646-1" nil 'prepend)
(set-fontset-font
 "fontset-chinese" 'han
 "-outline-宋体-normal-r-normal-normal-14-*-96-96- c-*-iso10646-1" nil 'prepend)
(set-fontset-font
 "fontset-chinese" 'cjk-misc
 "-outline-宋体-normal-r-normal-normal-14-*-96-96- c-*-iso10646-1" nil 'prepend)
(set-fontset-font
 "fontset-chinese" 'symbol
 "-outline-宋体-normal-r-normal-normal-14-*-96-96- c-*-iso10646-1" nil 'prepend)
(set-default-font "fontset-chinese")

;;-----------------------------------------------------
;;     Written by the CUSTOMIZE command
;;-----------------------------------------------------

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(cscope-display-cscope-buffer t)
 '(ecb-source-path (quote (("d:/work/090907-zte-qualcomm-#36706/workplace/vsuiteapp" "vsuiteapp_devel") ("d:/work/kalimba/mySecondApp" "mySecondDspApp") ("d:/work/perforce/f350/apps/f350apps/vsuiteapp" "vsuiteapp_main") ("d:/work/anve/code" "anve_code") (#("c:/Users/xiaohan/Desktop" 0 24 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu")) "Desktop") ("d:" "d:") ("d:/work/perforce/eval.xhli/vsuite3.2.12_release" "vsuite3.2.12"))))
 '(highlight-changes-initial-state (quote active))
 '(jde-jdk-registry (quote (("1.6.0" . "c:\\Program Files\\Java\\jdk1.6.0_14"))))
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60)))
 '(tab-width 4))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(tabbar-default-face ((t (:inherit variable-pitch :background "gray72" :foreground "gray50" :height 0.9))))
 '(tabbar-selected-face ((t (:inherit tabbar-default-face :background "gray30" :foreground "white" :box (:line-width 2 :color "white" :style released-button)))))
 '(tabbar-unselected-face ((t (:inherit tabbar-default-face :background "gray90" :box (:line-width 2 :color "white" :style pressed-button))))))
