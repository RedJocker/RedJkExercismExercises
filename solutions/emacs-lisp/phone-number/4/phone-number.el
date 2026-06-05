;;; phone-number.el --- phone-number (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

(defmacro thread-first (value &rest fns)
  "Thread VALUE through each function in FNS."
  (let ((result value))
    (dolist (fn fns)
      (setq result `(funcall ,fn ,result)))
    result))

(define-error 'area-code-starting-with-0-error "Invalid Area-Code")
(define-error 'area-code-starting-with-1-error "Invalid Area-Code")
(define-error 'exchange-code-starting-with-0-error "Invalid Exchange-Code")
(define-error 'exchange-code-starting-with-1-error "Invalid Exchange-Code")
(define-error 'country-code-error "Invalid Country Code")
(define-error 'short-phone-num-error "Phone Number is too short")
(define-error 'long-phone-num-error "Phone Number is too long")
(define-error 'punctuations-in-phone-num-error "Phone Number has invalid puctuation")
(define-error 'letters-in-phone-num-error "Phone Number has invalid letters")


(defun numbers (num)
  (thread-first
    num
    (phone-number-parse)
    (phone-number-as-number)))


(defun area-code (num)
  (alist-get :area-code (phone-number-parse-area num)))


(defun pprint (num)
  (let ((phone-number-alist (phone-number-parse num)))
    (format "(%s) %s-%s"
            (alist-get :area-code phone-number-alist)
            (alist-get :exchange-code phone-number-alist)
            (alist-get :subscriber-code phone-number-alist))))


(defun phone-number-as-number(phone-number-alist)
  (format "%s%s%s"
          (alist-get :area-code phone-number-alist)
          (alist-get :exchange-code phone-number-alist)
          (alist-get :subscriber-code phone-number-alist)))


(defun phone-number-parse(num)
  (thread-first
    num
    (phone-number-parse-area)
    (phone-number-parse-exchange)
    (phone-number-parse-subscriber)))


(defun phone-number-strip-country(num)
  (if (string-match "^\\(\+?1\\)\s*\\(.*\\)?$" num)
      (match-string 2 num)
    num))


(defun phone-number-parse-area(num)
  (let ((without-country (phone-number-strip-country num)))
    (when (string-blank-p without-country)
      (error "invalid blank string"))
    (if (or
         (string-match "^(\\([2-9][0-9][0-9]\\))\\(.*\\)?$" without-country)
         (string-match "^\\([2-9][0-9][0-9]\\)\\(.*\\)?$" without-country))
        (list
         `(:area-code . ,(match-string 1 without-country))
         `(:rest-area-code . ,(match-string 2 without-country))
         `(:original-input . ,num))
      (cond
       ((or (string-match "^1" without-country)
            (string-match "^(1" without-country))
        (signal 'area-code-starting-with-1-error nil))
       ((or (string-match "^0" without-country)
            (string-match "^(0" without-country))
        (signal 'area-code-starting-with-0-error nil))
       ((string-match "[a-zA-Z]" without-country)
        (signal 'letters-in-phone-num-error nil))
       (t (signal 'punctuations-in-phone-num-error nil))))))

(defun phone-number-parse-exchange(with-area-parsed)
  (let* ((rest (alist-get :rest-area-code with-area-parsed))
         (trimmed (string-trim-left rest " +\\|[.-]")))
    (if
        (string-match "^\\([2-9][0-9][0-9]\\)\\(.*\\)?$" trimmed)
        (progn 
          (push `(:exchange-code . ,(match-string 1 trimmed))
                with-area-parsed)
          (push `(:rest-exchange-code . ,(match-string 2 trimmed))
                with-area-parsed)
          with-area-parsed)
      (cond
       ((or (string-match "^1" trimmed)
            (string-match "^(1" trimmed))
        (signal 'exchange-code-starting-with-1-error nil))
       ((or (string-match "^0" trimmed)
            (string-match "^(0" trimmed))
        (signal 'exchange-code-starting-with-0-error nil))
       ((string-match "[a-zA-Z]" trimmed)
        (signal 'letters-in-phone-num-error nil))
       (t (signal 'punctuations-in-phone-num-error nil))))))

(defun phone-number-parse-subscriber(with-exchange-parsed)
  (let* ((rest (alist-get :rest-exchange-code with-exchange-parsed))
         (trimmed (string-trim-left rest " +\\|[.-]")))
    (if
        (string-match "^\\([0-9][0-9][0-9][0-9]\\)\s*$" trimmed)
        (progn 
          (push `(:subscriber-code . ,(match-string 1 trimmed))
                with-exchange-parsed)
          with-exchange-parsed)
      (cond
       ((string-match "^\\([0-9]\\{5\\}\\)\s*$" trimmed)
        (signal 'country-code-error nil))
       ((string-match "^\\([0-9]\\{6,\\}\\)\s*$" trimmed)
        (signal 'long-phone-num-error nil))
       ((string-match "^\\([0-9]\\{0,3\\}\\)\s*$" trimmed)
        (signal 'short-phone-num-error nil))
       ((string-match "[a-zA-Z]" trimmed)
        (signal 'letters-in-phone-num-error nil))
       (t (signal 'punctuations-in-phone-num-error nil))))))


(provide 'phone-number)
;;; phone-number.el ends here
