(ns interest-is-interesting)

(defn interest-rate
  "Calculates the interest rate based on the specified balance"
  [balance]
  (cond
    (< balance 0) -3.213
    (< balance 1000) 0.5
    (< balance 5000) 1.621
    :else 2.475))

(defn annual-balance-update
  "Calculate the annual balance update, taking into account the interest rate"
  [balance]
  (+ balance
     (* (if (< balance 0) (- balance) balance)
        (/ (bigdec (interest-rate balance))
           100M))))

(defn amount-to-donate
  "Calculate how much money to donate to charities based on the balance
  and the tax-free percentage that the government allows"
  [balance tax-free-percentage]
  (int (Math/floor (if (> balance 0)
                     (* 2 balance (/ tax-free-percentage 100))
                     0))))