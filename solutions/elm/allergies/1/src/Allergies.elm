module Allergies exposing (Allergy(..), isAllergicTo, toList)

import Bitwise
import List


type Allergy
    = Eggs
    | Peanuts
    | Shellfish
    | Strawberries
    | Tomatoes
    | Chocolate
    | Pollen
    | Cats


allergyCode : Allergy -> Int
allergyCode allergy =
    case allergy of
        Eggs ->
            1

        Peanuts ->
            2

        Shellfish ->
            4

        Strawberries ->
            8

        Tomatoes ->
            16

        Chocolate ->
            32

        Pollen ->
            64

        Cats ->
            128


isAllergicTo : Allergy -> Int -> Bool
isAllergicTo allergy score =
    let
        code =
            allergyCode allergy
    in
    Bitwise.and code score |> (==) code


toList : Int -> List Allergy
toList score =
    [ Eggs
    , Peanuts
    , Shellfish
    , Strawberries
    , Tomatoes
    , Chocolate
    , Pollen
    , Cats
    ]
        |> List.filter (\allergy -> isAllergicTo allergy score)
