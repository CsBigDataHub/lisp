;;; compose.el -- typing accents and mathematical chars using a compose key.

;; Copyright (C) 2001,2002,2003,2004 Free Software Foundation, Inc.
;;
;; This file is part of GNU eev.
;;
;; GNU eev is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; GNU eev is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU eev; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.
;;
;; Author:     Eduardo Ochs <edrx@mat.puc-rio.br>
;; Maintainer: Eduardo Ochs <edrx@mat.puc-rio.br>
;; Version:    2005jan04
;; Keywords:   i18n, mathematical chars, glyphs
;;
;; Latest version: <http://angg.twu.net/eev-current/compose.el>
;;       htmlized: <http://angg.twu.net/eev-current/compose.el.html>

;;; Comment:

;; So you've been asking yourself how I (edrx) type those characters
;; like "", "�" and "�"...
;; Here it is:
;;   "" is with C-q C-o
;;   "�" is with M-, < <
;;   "�" is with M-, > >
;; This file implements the command associated to `M-,'.
;; See: <http://angg.twu.net/eev-current/glyphs.el.html>.

;; (find-angg "compose-old.el")
;; (find-es "lua5" "composes")
;; (find-es "emacs" "key_name")
;; (find-elnode "Reading One Event")
;; (find-angg "vtutil4/isomath.el")

(defun compose-pair (pair) (interactive "sTwo-character code: ")
  (let ((sublist (member pair composes-all)))
    (if sublist (insert (nth 1 sublist))
      (error "Pair \"%s\" not in composes-all" pair))))

(defun compose-two-keys () (interactive)
  (compose-pair (format "%c%c"
			(read-event "Compose key 1: " t)
			(read-event "Compose key 2: " t))))

(if window-system
    (global-set-key [?\C-,] 'compose-two-keys))
(global-set-key     [?\M-,] 'compose-two-keys)

(defvar composes-accents '(
   "`A" ?�   "`E" ?�   "`I" ?�   "`O" ?�   "`U" ?�
   "`a" ?�   "`e" ?�   "`i" ?�   "`o" ?�   "`u" ?�
   "'A" ?�   "'E" ?�   "'I" ?�   "'O" ?�   "'U" ?�
   "'a" ?�   "'e" ?�   "'i" ?�   "'o" ?�   "'u" ?�
   "^A" ?�   "^E" ?�   "^I" ?�   "^O" ?�   "^U" ?�
   "^a" ?�   "^e" ?�   "^i" ?�   "^o" ?�   "^u" ?�
   "~A" ?�                       "~O" ?�
   "~a" ?�                       "~o" ?�
  "\"A" ?�  "\"E" ?�  "\"I" ?�  "\"O" ?�  "\"U" ?�
  "\"a" ?�  "\"e" ?�  "\"i" ?�  "\"o" ?�  "\"u" ?�
   "'C" ?�   "CC" ?�   "~N" ?�
   "'c" ?�   "cc" ?�   "~n" ?�
))
(defvar composes-otheriso '(
   "_a" ?�   "_o" ?�   "AE" ?�   "ae" ?�   "ss" ?�
   "!!" ?�   "??" ?�   "SS" ?�   "<<" ?�   ">>" ?�
   "00" ?�   "11" ?�   "22" ?�   "33" ?�
   "14" ?�   "12" ?�   "34" ?�
   "+-" ?�   ":-" ?�   "cd" ?�   "xx" ?�
))
(defvar composes-globalmath nil)
(defvar composes-localmath nil)
(defvar composes-all nil)

(defun composes-update ()
  (setq composes-all (append composes-localmath composes-globalmath
			     composes-accents composes-otheriso)))
(composes-update)

;; (find-elnode "Testing Accessibility" "file-exists-p")
;; (find-angg "vtutil4/isomath.el")
;;
;; (if (file-exists-p "~/vtutil4/isomath.el")
;;   (load "~/vtutil4/isomath.el"))


;; Local Variables:
;; coding:            raw-text-unix
;; ee-anchor-format:  "�%s�"
;; ee-comment-prefix: ";;"
;; End:
