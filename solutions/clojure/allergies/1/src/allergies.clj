(ns allergies)

(def allergies-map
  {
     :eggs 0
     :peanuts 1
     :shellfish 2
     :strawberries 3
     :tomatoes 4
     :chocolate 5
     :pollen 6
     :cats 7
  })

(defn allergic-to? [code key]
  (->> (key allergies-map)
    (bit-shift-right code)
    (bit-and 1)
    (= 1)))

(defn allergies [code]
  (filter #(allergic-to? code %) (keys allergies-map)))
