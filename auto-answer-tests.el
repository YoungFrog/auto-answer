;;; auto-answer-tests.el --- Tests for auto-answer   -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Nicolas Richard

;; Author: Nicolas Richard <youngfrog@members.fsf.org>
;; Keywords: tests

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

;; 

;;; Code:

(ert-deftest auto-answer-test ()
  (should (eq t
              (let ((auto-answer '(("foo" t))))
                (y-or-n-p "foo"))))
  (should (eq nil
              (let ((auto-answer '(("\\`foo\\'" nil))))
                (y-or-n-p "foo"))))
  (should (equal "jack"
              (let ((auto-answer '(("\\`What's your name\\? \\'" "jack"))))
                (read-string "What's your name? ")))))

(provide 'auto-answer-tests)
;;; auto-answer-tests.el ends here
