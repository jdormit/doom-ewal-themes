;;; ewal-doom-themes.el --- Dread the colors of darkness -*- lexical-binding: t; -*-

;; Copyright (C) 2019-2020 Uros Perisic

;; Author: Uros Perisic
;; URL: https://gitlab.com/jjzmajic/ewal

;; This program is free software: you can redistribute it and/or modify it under
;; the terms of the GNU General Public License as published by the Free Software
;; Foundation, either version 3 of the License, or (at your option) any later
;; version.

;; This program is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
;; FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
;; details.

;; You should have received a copy of the GNU General Public License along with
;; this program. If not, see <http://www.gnu.org/licenses/>.

;; This file is not part of Emacs.

;;; Commentary:

;; An `ewal'-based theme library, to be used when working with
;; `doom-themes' as a base.

;;; Code:
(require 'ewal)
(require 'doom-themes)

(defun ewal-doom-themes-get-color (color &optional shade shade-percent-difference)
  "Return COLOR of SHADE with SHADE-PERCENT-DIFFERENCE repeated 3 times.
This fits `def-doom-theme' and works because `ewal' automatically
deals with tty contexts."
  (let ((color (ewal-get-color color shade shade-percent-difference)))
    `(,color ,color ,color)))

(provide 'ewal-doom-themes)
;;; ewal-doom-themes.el ends here
