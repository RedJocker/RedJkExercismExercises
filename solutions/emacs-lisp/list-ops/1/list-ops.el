;;; list-ops.el --- List Ops (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun list-foldl (fun list accu)
  (cl-labels ((folder (l acc)
                (if (null l)
                    acc
                  (folder (cdr l) (funcall fun acc (car l))))))
    (folder list accu)))

(defun list-foldr (fun list accu)
  (cl-labels ((folder (l acc)
                (if (null l)
                    acc
                  (folder (cdr l) (funcall fun (car l) acc)))))
    (folder (reverse list) accu)))

(defun list-empty-p (list)
  (null list))

(defun list-sum (list)
  (apply #'+ list))

(defun list-length (list)
  (cl-labels ((counter (l count)
                (if (null l)
                    count
                  (counter (cdr l) (1+ count)))))
    (counter list 0)))

(defun list-append (list1 list2)
  (cl-labels ((chain (l1 l2 acc)
                (if (null l1)
                    (if (null l2)
                        (reverse acc)
                      (chain l2 nil acc))
                  (chain (cdr l1) l2 (cons (car l1) acc)))))
    (chain list1 list2 '())))

(defun list-reverse (list)
  (cl-labels ((rev (l acc)
                (if (null l)
                    acc
                  (rev (cdr l) (cons (car l) acc)))))
    (rev list '())))

(defun list-concatenate (list1 list2 &rest LISTS)
  (cl-labels ((chain (current all acc)
                (if (null current)
                    (if (null all)
                        (reverse acc)
                      (chain (car all) (cdr all) acc))
                  (chain (cdr current) all (cons (car current) acc)))))
    (chain list1 (cons list2 LISTS) '())))

(defun list-filter (list predicate)
  (cl-labels ((filter (l acc)
                (if (null l)
                    (reverse acc)
                  (if (funcall predicate (car l))
                      (filter (cdr l) (cons (car l) acc))
                    (filter (cdr l) acc)))))
    (filter list '())))

(defun list-map (list fun)
  (cl-labels ((mapper (l acc)
                (if (null l)
                    (reverse acc)
                  (mapper (cdr l) (cons (funcall fun (car l)) acc)))))
    (mapper list '())))

(provide 'list-ops)
;;; list-ops.el ends here
