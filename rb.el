;;; rb.el --- control rhythmbox from emacs -*- lexical-binding: t -*-

;; Copyright (C) 2013  Nic Ferrier

;; Author: Nic Ferrier <nferrier@ferrier.me.uk>
;; Keywords: multimedia
;; Version: 0.0.1
;; Package-Requires: ((s.el "1.4.0"))

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

;; Some very simple tools to work with RyhthmBox via your music
;; folder.

;;; Code:


(require 's)

(defun rb-queue (song)
  "Play the specified SONG."
  (interactive
   (list (dired-get-filename)))
  (let ((dir (file-name-directory song))
        (file-name (file-name-nondirectory song)))
    (let ((default-directory dir))
      (shell-command-to-string
       (s-lex-format "rhythmbox-client --enqueue \"${file-name}\"")))))

(defun rb-what ()
  "What's playing?"
  (interactive)
  (message
   "rb is playing: %s"
   (car
    (split-string
     (shell-command-to-string "rhythmbox-client --print-playing")
     "\n"))))

(provide 'rb)

;;; rb.el ends here
