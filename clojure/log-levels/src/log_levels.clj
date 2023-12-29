(ns log-levels
  (:require [clojure.string :as str]))

(defn message
  "Takes a string representing a log line
   and returns its message with whitespace trimmed."
  [log-line]
  (str/trim
    (str/replace log-line #"\[\w*]: " "")))

(defn log-level
  "Takes a string representing a log line
   and returns its level in lower-case."
  [log-line]
  (->> (re-matches #"^\[(\w*)]: (?:.|\s)*$" log-line)
       (last)
       (str/lower-case)))

(defn reformat
  "Takes a string representing a log line and formats it
   with the message first and the log level in parentheses."
  [log-line]
  (let [[_,log-level,log-msg] (re-matches
                                #"^\[(\w*)]: ((?:.|\s)*)$"
                                log-line)]
    (format "%s (%s)"
      (str/trim log-msg)
      (str/lower-case log-level))))
