(import (rnrs))

(define (string-sort str)
  (list->string (sort (string->list str) char-ci<?)))

(define (anagram target words)
  (let ((sorted-target (string-sort target))
        (words-to-sorted-words (map
                                (lambda (word) (cons word (string-sort word)))
                                (filter (lambda (word) (=
                                                   (string-length target)
                                                   (string-length word)))
                                        words))))
    
    (map car
         (filter (lambda (word-to-sorted-word)
                   (and (not (string-ci=? target (car word-to-sorted-word)))
                        (string-ci=? sorted-target (cdr word-to-sorted-word))))
                 words-to-sorted-words))))

