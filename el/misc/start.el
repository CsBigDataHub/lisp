;;; start.el --- Main Emacs startup file: require/autoload other files.
;;
;; Filename: start.el
;; Description: Main Emacs startup file: require/autoload other files.
;; Author: Drew Adams
;; Maintainer: Drew Adams
;; Copyright (C) 1995-2006, Drew Adams, all rights reserved.
;; Created: Wed Aug  2 11:12:24 1995
;; Version: 21.1
;; Last-Updated: Fri Sep 15 15:02:06 2006 (-25200 Pacific Daylight Time)
;;           By: dradams
;;     Update #: 2508
;; URL: http://www.emacswiki.org/cgi-bin/wiki/start.el
;; Keywords: abbrev, internal, local, init
;; Compatibility: GNU Emacs 20.x, GNU Emacs 21.x, GNU Emacs 22.x
;;
;;    Drew Adams' Emacs startup file: requires/autoloads other files.
;;
;;  This file basically just does `require' and `autoload'.
;;
;;  The files `setup.el', `oneonone.el', and `setup-keys.el', required
;;  here, are companion files that do fairly essential
;;  configuration/customization of the editor.
;;
;;  The file `start-opt.el', not required here, is another companion
;;  file that does other recommended configuration/customization.  If
;;  you decide to load it, that should be done after loading
;;  `start.el'.
;;
;;  Some other files that are required here are extensions to standard
;;  Emacs files that each need to be loaded either before or after the
;;  corresponding standard file.  Their names reflect this: the
;;  standard file name is used, with a `-' (`+') appended if the file
;;  is to be loaded before (after) the standard file.  For example,
;;  `foo-.el' is to be loaded before the standard file `foo.el',
;;  `foo+.el' is to be loaded after `foo.el'.
;;
;;  NOTE: Order of loading here works.  Other orders not guaranteed:).
;;
;;
;;  New user option (variable) defined here: `use-dired-x-p'.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Change log:
;;
;; 2006/09/15 dadams
;;    Protected dired-sort-menu+.el and browse-kill-ring+el by requiring parents.
;; 2006/09/14 dadams
;;    Require modeline-posn.el.
;; 2006/09/08 dadams
;;    Require 'crosshairs (Emacs 22), not hl-line+.el and idle-column.el.
;; 2006/09/04 dadams
;;    Require hl-line+.el and idle-column.el (Emacs 22).
;; 2006/07/30 dadams
;;    Replaced autoloads of thingatpt+.el with require of it and thing-cmds.el.
;; 2006/03/03 dadams
;;    Corrected require: apropos-function.el -> apropos-fn+var.el.
;; 2006/01/28 dadams
;;    Require: ediff+.el, dired-details+.el, savehist-20+.el.
;; 2005/12/31 dadams
;;    Require cl.el if load FJW's ls-lisp.el (Emacs 20).
;; 2005/12/26 dadams
;;    Require synonyms.el.
;; 2005/12/20 dadams
;;    Require dired-details+.el.
;; 2005/12/03 dadams
;;    Require apropos-fn+var.el.
;; 2005/08/13 dadams
;;    Require icicles-menu.el.
;; 2005/07/10 dadams
;;     elect-mbuf.el -> icicles.el.
;; 2005/07/07 dadams
;;     Require dired-sort-menu+.el, not dired-sort-menu.el.
;; 2005/05/17 dadams
;;     Updated to work with Emacs 22.x.
;; 2005/05/09 dadams
;;     Renamed setup-frames.el to oneonone.el.
;; 2005/04/21 dadams
;;     Require color-moccur and moccur-edit.
;; 2004/12/30 dadams
;;     Autoload lib-require.el.
;; 2004/12/10 dadams
;;     Require thumb-frm.el.
;; 2004/11/20 dadams
;;     Refined to deal with Emacs 21 < 21.3.50 (soon to be 22.x)
;; 2004/11/16 dadams
;;     Renamed old compile+.el to compile+20.el, compile-.el to compile-20.el.
;;     Require for Emacs 21: grep-.el, compile+.el (new version).
;; 2004/10/13 dadams
;;     Require replace+.el and buff-menu+.el for Emacs 21 also.
;; 2004/10/07 dadams
;;     Renamed resize* to fit*.
;;     Added require of tool-bar+.el.
;; 2004/10/03 dadams
;;     Updated for Emacs 21.
;;       Don't load libraries that haven't yet been tested for Emacs 21.
;;       Added hack for Emacs 21: Put something in *scratch* buffer to avoid
;;         getting a header there.
;;       NOTE: Byte-compiled delsel.el is different for Emacs 21 & Emacs 20;
;;             the two versions are incompatible.
;;     No longer require setup-info.el here (info+.el will load it).
;;     Soft requires when possible.
;;     Moved dired-sort-menu.el after dired+.el
;; 2004/09/10 dadams
;;     Replaced dlgopen.el with w32browser-dlgopen.el
;; 2004/06/01 dadams
;;     Renamed shrink-* to resize-*
;; 2001/01/03 dadams
;;     Require vc-hooks+ (vs eval-after-load, because vc-hooks is pre-loaded).
;; 2000/12/07 dadams
;;     1. Added requires of shrink-fit-all.el, font-menus.el.
;;     2. Added autoload of cursors.el.
;; 2000/11/09 dadams
;;     Changed require training-cc to autoload
;; 2000/11/07 dadams
;;     Added requires: local-ps-print, training-cc, printing.
;; 2000/11/01 15:46:04  dadams
;;     Put imenu-add-defs-to-menubar inside condition-case, in c-mode-*-hook.
;; 2000/09/27 dadams
;;     Require bookmark+.el.
;; 1999/10/07 dadams
;;     1. Require cal-opts.el.
;;     2. Require calendar+.el after load cal-french & diary-lib.
;; 1999/09/03 dadams
;;     Require pp+.el.
;; 1999/09/03 dadams
;;     Require dired+.el (not just eval-after-load).
;; 1999/09/02 dadams
;;     Require menu-bar+.el before setup-keys.el.
;; 1999/08/30 dadams
;;     Require imenu+.el.
;; 1999/04/14 dadams
;;     Added require: setup-info.el.
;; 1999/04/09 dadams
;;     Added: require highlight.el.
;; 1999/04/06 dadams
;;     Added: require compile+.
;; 1999/04/02 dadams
;;     Added requires: setup-frames, setup-keys.
;; 1999/04/01 dadams
;;     Added: require 'find-dired+, autoload make-regexp.
;; 1999/03/23 dadams
;;     Require dired+.el.
;; 1999/03/17 dadams
;;     Update to version 19.34.1:
;;     1. Added require: frame-fns, help+.
;;     2. Changed require to eval-after-load: vc+.
;;     3. Added autoload: erase-nonempty-inactive-minibuffer,
;;        update-file-autoloads, unaccent-word, unaccent-region, unaccent-char,
;;        kill-region-wimpy, auto-make-header, make-header.
;; 1996/07/15 dadams
;;     eval-after-load: timer+.el.
;; 1996/07/11 dadams
;;     Require novice+.el after load novice.el.
;; 1996/04/18 dadams
;;     Added use-dired-x-p.  Set up dired-x when use-dired-x-p.
;; 1996/04/15 dadams
;;     Require frame+.el.
;; 1996/04/12 dadams
;;     Require simple+.el.
;; 1996/03/08 dadams
;;     Require menu-bar+.el.
;; 1996/02/14 dadams
;;     Autoload thingatpt+.el for more fns.
;; 1996/02/02 dadams
;;     Require window+.el, replace+.el.
;; 1995/12/15 dadams
;;     Require dired+.el.
;; 1995/12/05 dadams
;;     Require cl.el.
;; 1995/10/17 dadams
;;     Require icomplete+.el.
;; 1995/09/13 dadams
;;     Load info+.el.
;; 1995/09/11 dadams
;;     Require buff-menu+.el.
;; 1995/09/11 dadams
;;     Require vc+.el
;; 1995/09/04 dadams
;;     Require iso-transl.el.
;; 1995/08/18 dadams
;;     Added imenu-add-defs-to-menubar, and put it on c-mode hook.
;; 1995/08/11 dadams
;;     Require files+.el.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;

(provide 'start)
(require 'start) ;; Ensure this file is loaded before compile it.

;;;;;;;;;;;;;;;;;;;;;;


(and (< emacs-major-version 20) (eval-when-compile (require 'cl))) ;; when, unless

;;; Hack needed if you load `start-opt.el', because it does this:
;;;    (add-hook 'lisp-mode-hook             'auto-make-header)
;;; Without this hack, you get a lisp header from header2.el
;;; in the *scratch* buffer!
(when (>= emacs-major-version 21)
  (save-excursion
    (set-buffer (get-buffer-create "*scratch*"))
    (insert "Evaluate Emacs Lisp expressions here. `C-h m' for details\n\n\n\n\n")))

(require 'misc-fns nil t)               ; Miscellaneous non-interactive functions
(require 'simple+ nil t)                ; Corrections, extensions.
(require 'frame+ nil t)                 ; Corrections, extensions.
(autoload 'lib-requires-tree "lib-requires" ; Track Emacs-Lisp library dependencies.
  "The libraries `require'd by LIBRARY, as a tree." t)
(autoload 'lib-requires "lib-requires"
  "The libraries ultimately `require'd by LIBRARY, as a flat list." t)
(autoload 'insert-lib-requires-as-comment "lib-requires"
  "Insert a comment listing all libraries ultimately required by LIBRARY." t)
(require 'frame-cmds nil t)             ; Frame and window commands.
(require 'autofit-frame nil t)          ; automatically fit frames to sole window.
(require 'files+ nil t)                 ; Redefinitions.

;; LOAD `oneonone.el' BEFORE load `htmlize.el', because `htmlize.el' breaks
;; something so that frames like help-frame remain invisible.
;; LOAD `oneonone.el' BEFORE load `find-dired+', because that loads `mkhtml.el',
;; which loads `htmlize.el'.
(require 'oneonone nil t)               ; Default frame configuration.
(when (boundp 'mode-line-position)      ; Emacs 22 - Mode line position highlighting.
  (require 'modeline-posn nil t))
(require 'window+ nil t)                ; Corrections.
;; (require 'apropos)                      ; My version.
(require 'paren)                        ; Highlight matching parens (standard GNU).
(when window-system
  (autoload 'paren-activate "mic-paren" "" t) ; Turns on alternative paren highlighting.
  (autoload 'paren-deactivate "mic-paren" "" t) ; Turns it off.
  (autoload 'paren-toggle-matching-paired-delimiter "mic-paren" "" t) ; For LaTeX etc: $...$
  (autoload 'paren-toggle-matching-quoted-paren "mic-paren" "" t) ; Toggle highlighting escaped parens.
  (autoload 'paren-toggle-open-paren-context "mic-paren" "" t)
  (defvar paren-sexp-mode t)
  (defvar paren-message-linefeed-display "^J")) ; Toggle in/out context for open paren.
(require 'bookmark+ nil t)              ; Extensions to bookmark.el.
(require 'iso-transl nil t)             ; Keyboard input definitions for ISO 8859/1.
(require 'eshell-auto nil t)            ; Eshell
(require 'em-joc nil t)                 ; Extensions to eshell
(require 'pcmpl-auto nil t)             ; Pcomplete

;; Use Francis Wright's version of `ls-lisp.el', if available.
(when (< emacs-major-version 21)
  (require 'cl) ;; FJW's `ls-lisp.el' uses `mapc', so we need `cl.el'.  Too bad.
  (add-hook 'dired-load-hook (lambda () (load-library "ls-lisp"))))

;; `ls-lisp-verbosity.el' is essentially `leo-toggle-ls-lisp-verbosity'
;;     from (http://www.emacswiki.org/cgi-bin/emacs-en/LsLispToggleVerbosity)
(require 'ls-lisp-verbosity nil t)

;; Dired-X:
(defvar use-dired-x-p t "*Non-nil means that `dired-x' package is to be loaded.
See the Dired-X Info pages (type \\[info]) for information on this package.")
(require 'dired-x nil t)
(when use-dired-x-p
  (add-hook 'dired-load-hook            ; To be done before dired is loaded.
            (function (lambda ()
                        ;; Bind `dired-x-find-file' in place of `find-file'.
                        (setq dired-x-hands-off-my-keys nil)
                        (load "dired-x")
                        ;; Set other dired-x variables here.  For example:
                        ;; (setq dired-guess-shell-gnutar "gtar")
                        (setq dired-omit-files
                              (concat dired-omit-files "\\|^RCS$\\|^SCCS$"))
                        (setq dired-x-hands-off-my-keys nil))))
;;;  (add-hook 'dired-mode-hook
;;;            (function (lambda ()
;;;                        ;; Set dired-x buffer-local variables here.  E.g.:
;;;                        ;; (setq dired-omit-files-p t))))
  )

;; Note: `find-dired+.el' loads `dired+.el', which loads `mkhtml.el'.
(when (< emacs-major-version 21)
  (require 'find-dired+ nil t))         ; Improvements.
(require 'frame-fns nil t)              ; Non-interactive frame and window functions.
(require 'buff-menu+ nil t)             ; My replacements.
(require 'misc-cmds nil t)              ; Miscellaneous commands.
(when (< emacs-major-version 21)
  (require 'vc-hooks+ nil t)            ; VC fixes and options.
  (eval-after-load "vc" '(require 'vc+ nil t))) ; VC fixes and options.
(if (not (eq emacs-major-version 22))
    (require 'compile+20 nil t)         ; Highlighting, etc.
  (require 'compile+)                   ; Highlighting.
  (require 'grep+))                     ; Highlighting.
(require 'replace+ nil t)               ; Redefinitions, corrections.
(eval-after-load "pp" '(require 'pp+ nil t)) ; Extensions to `pp.el'.
(require 'isearch+ nil t)               ; Bug fix, more keys, help.
(require 'occur-schroeder nil t)        ; Occur alternative & isearch option.
(load-library "delsel")
(require 'highlight nil t)              ; Simple highlighting commands.
(when (< emacs-major-version 21)
  (require 'help+ nil t))               ; Extensions to `help.el'.
(when (eq emacs-major-version 22) (require 'help-mode+)) ; Extensions to `help-mode.el'.
(require 'cus-edit+ nil t)              ; Extensions to `cus-edit.el'.
(require 'thingatpt+ nil t)             ; Thing-at-point extensions.
(require 'thing-cmds nil t)             ; Thing-at-point commands.
(require 'imenu+ nil t)                 ; Extensions to `imenu.el'.
(autoload 'imenu-create-hierarchical-index "hier-imenu" ; Hierarchical imenu for HTML, Tex
  "Generate an alist for imenu from a buffer with hierarchical structure.")
(add-hook 'tex-mode-hook 'imenu-add-menubar-index)
(autoload 'hier-imenu-dtd-setup "hier-imenu"
  "Scan buffer for a DTD and set `hier-imenu' parameters accordingly.")
(add-hook 'sgml-mode-hook 'hier-imenu-dtd-setup)

;;; Load `w32browser-dlgopen.el' before `menu-bar+.el'.
(when (eq system-type 'windows-nt)
  (require 'w32browser-dlgopen nil t)) ; MS Windows Open file dialog box.

;; Moccur - like occur, but for multiple buffers.
(setq moccur-use-ee nil)
(setq moccur-split-word t)
;;(setq *moccur-buffer-name-exclusion-list* '(".+TAGS.+" "*Completions*" "*Messages*"))
(setq dmoccur-use-list t)
(setq dmoccur-list '(("dir" default-directory (".*") dir)))
(require 'color-moccur nil t)
(when (fboundp 'dired-do-moccur) (define-key dired-mode-map "E" 'dired-do-moccur))
(when (fboundp 'Buffer-menu-moccur) (define-key Buffer-menu-mode-map "E" ''Buffer-menu-moccur))
(when (fboundp 'occur-by-moccur)
  (global-set-key "\C-x\C-o" 'occur-by-moccur)) ; was `delete-blank-lines'
(when (fboundp 'moccur) (global-set-key "\C-c\C-x\C-o" 'moccur))
(when (fboundp 'grep-buffers) (global-set-key "\C-cg" 'grep-buffers))
(when (fboundp 'search-buffers) (global-set-key "\C-c\C-o" 'search-buffers))
(require 'moccur-edit nil t)            ; Edit files by editing the Moccur buffer.


(autoload 'ispell-word "ispell"
  "Check spelling of word at or before point" t)
(autoload 'ispell-complete-word "ispell"
  "Complete word at or before point" t)
(autoload 'ispell-region "ispell"
  "Check spelling of every word in the region" t)
(autoload 'ispell-buffer "ispell"
  "Check spelling of every word in the buffer" t)

(autoload 'make-regexp "make-regexp"
  "Return a regexp to match a string item in STRINGS.")
(autoload 'make-regexps "make-regexp"
  "Return a regexp to REGEXPS.")

(autoload 'apropos-user-options "apropos+" "Show user options that match REGEXP." t)
(autoload 'erase-nonempty-inactive-minibuffer "strings"
  "Erase the minibuffer, if inactive and `minibuffer-empty-p'." t)
(autoload 'update-file-autoloads "autoload+"
  "Update the autoloads for FILE in `generated-autoload-file'" t)
(autoload 'unaccent-word "unaccent"
  "Move curseur forward NUM (prefix arg) words, removing accents." t)
(autoload 'unaccent-region "unaccent"
  "Replace accented chars between START and END by unaccented chars." t)
(autoload 'unaccent-char "unaccent"
  "Replace accented char at curser by corresponding unaccented char(s)." t)
(autoload 'kill-region-wimpy "wimpy-del"
  "Kill region, with confirmation if > `wimpy-delete-size'." t)
(autoload 'clipboard-kill-region-wimpy "wimpy-del"
  "Kill region, with confirmation if > `wimpy-delete-size'." t)
(autoload 'auto-make-header "header2"
  "Call `make-header' if current buffer is empty." t)
(autoload 'update-file-header "header2" "Update file header." t)
(autoload 'make-header "header2"
  "Insert (mode-dependent) header comment at beginning of file." t)
(autoload 'make-revision "header2"
  "Prepare for a new history comment." t)
(when (eq emacs-major-version 22)
  (require 'crosshairs nil t))          ; Highlight current line and column when Emacs is idle.
(require 'setup nil t)                  ; Startup assignments and such.
(require 'local-lpr nil t)              ; Local settings for `lpr.el'.
(require 'local-ps-print nil t)         ; Local settings for PostScript printing.
(require 'printing nil t)               ; Printing from menu bar etc.
(require 'facemenu+ nil t)              ; New Text Properties menu items.
(autoload 'define-doremi "doremi-mac" "Define a Do Re Mi command." nil 'macro)
(require 'doremi-frm nil t)             ; Dynamic adjustment of frame properties.  Loads `doremi.el'.
(require 'doremi-cmd nil t)             ; Other Do Re Mi commands.
(require 'thumb-frm nil t)              ; Fisheye view and thumbnail frames.
(require 'zoom-frm nil t)               ; Zoom frame, changing its font size.
(eval-after-load "info" '(require 'info+ nil t)) ; Extensions to `info.el'.

;;; LOAD `menu-bar+.el' *BEFORE* `setup-keys.el'.
(require 'menu-bar+ nil t)              ; Extensions to `menu-bar.el'.  Also loads `info+.el'.
(require 'apropos-fn+var nil t)         ; Extensions to `apropos.el'.
(require 'icicles nil t)                ; Minibuffer completion, completion-candidate cycling.
(require 'icicles-menu nil t)           ; Menu-bar menu-command completion and execution via keyboard.
(require 'synonyms nil t)               ; Thesaurus.
(when (>= emacs-major-version 21) (require 'tool-bar+ nil t)) ; Extensions to `tool-bar.el'.
(require 'icomplete+ nil t)             ; Sorted, colored icompletion
(require 'setup-keys nil t)             ; Key bindings.
(when (< emacs-major-version 21)
  (require 'mkhtml nil t)               ; Create HTML from Emacs buffers/files.
  (require 'cal-opts nil t)             ; Calendar and diary options.
  (eval-after-load "calendar" '(require 'calendar+ nil t)) ; Calendar, diary, appointment stuff.
  (eval-after-load "cal-french" '(require 'calendar+ nil t))
  (eval-after-load "diary-lib" '(require 'calendar+ nil t)))
(cond ((eq emacs-major-version 22)
       (eval-after-load "diff" '(require 'diff+ nil t)) ; Extensions to `diff.el'.
       (require 'diff-mode-))           ; Extensions to `diff-mode.el'.
      ((>= emacs-major-version 21)
       (require 'diff-mode-)            ; Extensions to `diff-mode.el'.
       (require 'diff-mode))            ; Doesn't get loaded by `diff', apparently.
      (t
       (eval-after-load "diff" '(require 'diff+20 nil t)))) ; Extensions to `diff.el'.
(require 'ediff+ nil t)                 ; Extensions to Ediff - toggle case sensitivity.
(require 'dired+ nil t)                 ; Extensions to Dired.
(when (require 'dired-sort-menu nil t)
  (require 'dired-sort-menu+ nil t))    ; Menu/dialogue for dired sort options
(require 'dired-details+ nil t)         ; Make file details hideable in dired
(unless (>= emacs-major-version 22)
  (require 'savehist-20+ nil t))        ; Save your history lists.
(eval-after-load "faces" '(require 'faces+ nil t)) ; Extensions to `faces.el'.
(autoload 'menu-bar-read-lispref "info+" "Access the Emacs Lisp manual via `Info'." t)
(autoload 'info-emacs-manual "info+" "Access the Emacs manual via \"Info\"." t)
(eval-after-load "macros" '(require 'macros+ nil t)) ; Extensions to `macros.el'.
(require 'mouse+ nil t)                       ; Extensions to `mouse.el'.
(eval-after-load "novice" '(require 'novice+ nil t)) ; Extensions to `novice.el'.
(when (< emacs-major-version 21)
  (eval-after-load "options" '(require 'options+ nil t))) ; Extensions to `options.el'.
;(eval-after-load "outline"
;  '(progn (require 'outline+)(require 'foldout))) ; Extensions to `outline.el'.
(eval-after-load "ring" '(require 'ring+ nil t)) ; Extensions to `ring.el'.
(unless (>= emacs-major-version 20)
  (eval-after-load "sort" '(require 'sort+))) ; Extensions to `sort.el'.
(eval-after-load "thingatpt" '(require 'thingatpt+ nil t)) ; Extensions to `thingatpt.el'.
(when (< emacs-major-version 21)
  (eval-after-load "timer" '(require 'timer+ nil t))) ; Extensions to `timer.el'.
;(eval-after-load "c-mode" '(require 'cc-mode+)) ; Extensions to `cc-mode.el'.
;(eval-after-load "cc-mode" '(require 'cc-mode+))
(when (< emacs-major-version 21)
  (eval-after-load "cc-mode"
    '(progn (require 'imenu+ nil t)
            (add-hook 'c-mode-common-hook
                      '(lambda () (condition-case nil
                                      (imenu-add-defs-to-menubar)
                                    (error nil)))))))
;(eval-after-load "vc" '(require 'vc+)) ; Extensions to `vc.el'.
(autoload 'display-line-numbers "line-num"
  "Temporarily display line numbers in left margin of current buffer." t)
(autoload 'setup-training-cc "training-cc" "Set up for code display with projector." t)
(autoload 'toggle-tabs-font-lock "show-wspace" "Toggle highlighting of TABs." t)
(autoload 'toggle-hardspace-font-lock "show-wspace"
  "Toggle highlighting of hard SPACE characters." t)
(autoload 'toggle-trailing-whitespace-font-lock "show-wspace"
  "Toggle highlighting of trailing whitespace." t)
(require 'font-menus nil t)             ; Additional font menus
(autoload 'joc-cursor-type-set-hook "cursors" "Make cursor reflect insert/overwrite mode." t)
(autoload 'ascii-on        "ascii" "Turn on ASCII code display."   t)
(autoload 'ascii-off       "ascii" "Turn off ASCII code display."  t)
(autoload 'ascii-display   "ascii" "Toggle ASCII code display."    t)
(autoload 'ascii-customize "ascii" "Customize ASCII code display." t)
(eval-after-load "ascii" '(progn (copy-face 'region 'ascii-ascii-face)
                                 (copy-face 'secondary-selection 'ascii-non-ascii-face)))
(autoload 'blank-mode-on "blank-mode" "Turn on blank visualization."   t)
(autoload 'blank-mode-off "blank-mode" "Turn off blank visualization."  t)
(autoload 'blank-mode "blank-mode" "Toggle blank visualization."    t)
(autoload 'blank-mode-customize "blank-mode" "Customize blank visualization." t)
(autoload 'setnu-mode "setnu+" "Toggle setnu-mode on/off." t)
(when (require 'browse-kill-ring nil t)
  (require 'browse-kill-ring+ nil t))

(when (> emacs-major-version 20)
  (autoload 'column-marker-1 "column-marker" "Highlight a column." t))

;;; Define some aliases so can find toggle commands easily.
(defalias 'toggle-abbrev-mode 'abbrev-mode)
(defalias 'toggle-auto-fill-mode 'auto-fill-mode)
(defalias 'toggle-auto-lower-mode 'auto-lower-mode)
(defalias 'toggle-auto-raise-mode 'auto-raise-mode)
(defalias 'toggle-auto-save-mode 'auto-save-mode)
(defalias 'toggle-binary-overwrite-mode 'binary-overwrite-mode)
(defalias 'toggle-compilation-minor-mode 'compilation-minor-mode) ; (defsubst)
(defalias 'toggle-delete-selection-mode 'delete-selection-mode) ; `delsel.el'.
(defalias 'toggle-double-mode 'double-mode)
(defalias 'toggle-enable-flow-control 'enable-flow-control)
(defalias 'toggle-font-lock-mode 'font-lock-mode)
(defalias 'toggle-hide-ifdef-mode 'hide-ifdef-mode)
(defalias 'toggle-iso-accents-mode 'iso-accents-mode)
(defalias 'toggle-menu-bar-mode 'menu-bar-mode)
(defalias 'toggle-overwrite-mode 'overwrite-mode)
(defalias 'toggle-scroll-bar-mode 'scroll-bar-mode)
(defalias 'toggle-standard-display-european 'standard-display-european)
(defalias 'toggle-transient-mark-mode 'transient-mark-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; start.el ends here
