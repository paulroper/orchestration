module Ordinal exposing (ordinal)


ordinal : Int -> String
ordinal num =
    let
        numString =
            String.fromInt num
    in
    if modBy 100 num == 11 then
        numString ++ "th"

    else
        case modBy 10 num of
            1 ->
                numString ++ "st"

            2 ->
                numString ++ "nd"

            3 ->
                numString ++ "rd"

            _ ->
                numString ++ "th"
