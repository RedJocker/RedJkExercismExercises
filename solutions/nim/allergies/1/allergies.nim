import std/tables

type
  Allergen* = enum
    Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats

let
  allergyScoreMap = [
       (Eggs, 1),
       (Peanuts, 2),
       (Shellfish, 4),
       (Strawberries, 8),
       (Tomatoes, 16),
       (Chocolate, 32),
       (Pollen, 64),
       (Cats, 128) 
  ].toOrderedTable

proc isAllergicTo*(score: int, allergen: Allergen): bool =
  let code = allergyScoreMap[allergen]
  (code and score) == code

proc allergies*(score: int): set[Allergen] =
  var
    result: set[Allergen] = {}
  for k in allergyScoreMap.keys:
    if isAllergicTo(score, k):
        result = result + {k}
  result
