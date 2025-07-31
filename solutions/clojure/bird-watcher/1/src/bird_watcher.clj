(ns bird-watcher)

(def last-week 
  [0 2 5 3 7 8 4])

(defn today [birds] 
  (last birds))

(defn inc-bird [birds] 
  (assoc birds 6 (inc (last birds))))

(defn day-without-birds? [birds] 
  (some? (some zero? birds)))

(defn n-days-count [birds n]  
  (reduce + (take n birds)))

(defn busy-days [birds]
  (count (filter #(>= %1 5) birds)))

(defn odd-week? [birds]
  (not= -1 (reduce 
            (fn [acc day] (cond (and (= 0 acc) (= 1 day)) 1
                            (and (= 1 acc) (= 0 day)) 0
                            :else -1))
            birds)))
