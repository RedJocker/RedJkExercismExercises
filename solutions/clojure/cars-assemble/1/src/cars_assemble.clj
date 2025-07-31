(ns cars-assemble)


(defn expected-success-rate [speed]
  "Return the expected success-rate for a certain speed"
  (cond (<= speed 0) 0.0
    (<= 1 speed 4) 1.0
    (<= 5 speed 8) 0.9
    (= 9 speed) 0.8
    :else 0.77))

(defn cars-production-goal [speed]
  "Returns the amount of cars that ideally would be produced if no fails ever happened"
  (* 221 speed))

(defn production-rate [speed]
  "Returns the assembly line's expected production rate per hour,
   taking into account its success rate"
  (let [cars-in-production (cars-production-goal speed)
        expected-success-rate (expected-success-rate speed)]
        (* cars-in-production expected-success-rate)))

(defn working-items [speed]
  "Calculates how many working cars are expected to be produced per minute"
  (int (/ (production-rate speed) 60)))
