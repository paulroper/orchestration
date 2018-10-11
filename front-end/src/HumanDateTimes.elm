module HumanDateTimes exposing (getDate, getTime)

import Ordinal
import Time


getDate : Time.Posix -> String
getDate posixTime =
    getWeekday (Time.toWeekday Time.utc posixTime)
        ++ " "
        ++ Ordinal.ordinal (Time.toDay Time.utc posixTime)
        ++ " "
        ++ getMonth (Time.toMonth Time.utc posixTime)
        ++ " "
        ++ String.fromInt (Time.toYear Time.utc posixTime)


getMonth : Time.Month -> String
getMonth month =
    case month of
        Time.Jan ->
            "January"

        Time.Feb ->
            "February"

        Time.Mar ->
            "March"

        Time.Apr ->
            "April"

        Time.May ->
            "May"

        Time.Jun ->
            "June"

        Time.Jul ->
            "July"

        Time.Aug ->
            "August"

        Time.Sep ->
            "September"

        Time.Oct ->
            "October"

        Time.Nov ->
            "November"

        Time.Dec ->
            "December"


getTime : Time.Posix -> String
getTime posixTime =
    padTime (String.fromInt (Time.toHour Time.utc posixTime))
        ++ ":"
        ++ padTime (String.fromInt (Time.toMinute Time.utc posixTime))
        ++ ":"
        ++ padTime (String.fromInt (Time.toSecond Time.utc posixTime))


padTime : String -> String
padTime time =
    String.padLeft 2 '0' time


getWeekday : Time.Weekday -> String
getWeekday weekday =
    case weekday of
        Time.Mon ->
            "Monday"

        Time.Tue ->
            "Tuesday"

        Time.Wed ->
            "Wednesday"

        Time.Thu ->
            "Thursday"

        Time.Fri ->
            "Friday"

        Time.Sat ->
            "Saturday"

        Time.Sun ->
            "Sunday"
