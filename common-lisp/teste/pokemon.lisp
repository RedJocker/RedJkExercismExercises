 (defun make-pokemon (&key name type atk hp)
	     (cond ((not (stringp name)) (error "name is not a string"))
		   ((not (member type '(grass fire earth water))) (error "not a valid type"))
		   ((not (integerp atk)) (error "atk must be an integer"))
		   ((not (integerp hp)) (error "hp must be an integer")))
			
	     `#(,name ,type ,atk ,hp))

(defun battle (attacker defender)
     (let* ((attacker-name (aref attacker 0))
	    (attacker-type (aref attacker 1))
	    (attacker-atk (aref attacker 2))
	    (attacker-hp (aref attacker 3))
					 
	    (defender-name (aref defender 0))
	    (defender-type (aref defender 1))
	    (defender-atk (aref defender 2))
	    (defender-hp (aref defender 3))
					 
	   (bonus (cond ((eql attacker-type defender-type) 1)
			((member `(,attacker-type ,defender-type) 
				 '((fire grass) (grass water) (water fire)) 
				  :test #'equal)
			           2 )
		        (T 0.5)))
	   (hit-points  (* attacker-atk bonus))
	   (new-defender-hp (- defender-hp hit-points)))
					 
					 
	  (cond ((<= new-defender-hp 0) attacker-name)
		 (t (battle 
		      `#(,defender-name ,defender-type ,defender-atk ,new-defender-hp)
		      `#(,attacker-name ,attacker-type ,attacker-atk ,attacker-hp))))
			
      )					 
 )
