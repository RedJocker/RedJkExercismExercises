;;; matching-brackets.el --- Matching Brackets (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defconst matching-brackets--opens "[{[(]")
(defconst matching-brackets--closes "[]})]")

(defun is-paired (str)
  "STR."
  (if (string-empty-p str)
      t
    (let ((last-open-index (matching-brackets--last-open-index str)))
      (if last-open-index
          (let ((matching-close-index
                 (matching-brackets--first-close-index
                  str (1+ last-open-index) (aref str last-open-index))))
            (when matching-close-index
              (and
               (is-paired (concat
                           (substring str 0 last-open-index)
                           (substring str (1+ matching-close-index))))
               (is-paired (substring str (1+ last-open-index) matching-close-index)))))
        (not (string-match matching-brackets--closes str))))))

(defun matching-brackets--last-open-index (str)
  "STR."
  (let* ((rev-str (reverse str))
         (index-last-open (string-match matching-brackets--opens rev-str)))
      (if (null index-last-open) nil
        (- (length str) (1+ index-last-open)))))

(defun matching-brackets--first-close-index (str start open-ch)
  "STR START OPEN-CH."
  (let ((close-ch (matching-brackets--closing-ch open-ch)))
    (string-match (string close-ch) str start)))
          
  
(defun matching-brackets--closing-ch (open-ch)
  "OPEN-CH."
  (cl-case open-ch
    (?\[ ?\])
    (?{ ?})
    (?\( ?\))
    (t (if (characterp open-ch)
           (error "Invalid open-ch ?%c" open-ch)
         (error "Invalid type %s, not a char" (type-of open-ch))))))

(provide 'matching-brackets)
;;; matching-brackets.el ends here
