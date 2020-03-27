;;; doom-ewal-themes.el --- Doom themes that read from the Pywal cache  -*- lexical-binding: t; -*-

;; Copyright (C) 2020

;; Author:  Jeremy Dormitzer <jeremy.dormitzer@gmail.com>
;; Version: 1.0
;; Package-Requires: ((emacs "25") (ewal "0.1") (doom-themes "0.1"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Code:
(require 'ewal)
(require 'doom-themes)

(defun ewal-doom-themes-get-color (color &optional shade shade-percent-difference)
  "Return COLOR of SHADE with SHADE-PERCENT-DIFFERENCE repeated 3
times.  This fits `def-doom-theme' and works because `ewal'
automatically deals with tty contexts."
  (let ((color (ewal-get-color color shade shade-percent-difference)))
    `(,color ,color ,color)))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (let* ((base (file-name-directory load-file-name))
         (dir (expand-file-name "themes/" base)))
    (add-to-list 'custom-theme-load-path dir)))

(provide 'doom-ewal-themes)

;;; doom-ewal-themes.el ends here
