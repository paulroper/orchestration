module Main exposing (Msg(..), main, update, view)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Http
import HumanDateTimes
import Json.Decode as Json
import Time


type alias Model =
    { message : String
    , time : Time.Posix
    }


type Msg
    = GetMessage
    | MessageText (Result Http.Error String)
    | Tick Time.Posix


main =
    Browser.element { init = init, subscriptions = subscriptions, update = update, view = view }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { message = "Fetch a message from the API", time = Time.millisToPosix 0 }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetMessage ->
            ( { model | message = "Loading..." }, getMessage )

        MessageText (Ok res) ->
            ( { model | message = res }, Cmd.none )

        MessageText (Err _) ->
            ( { model | message = "Oh no!" }, Cmd.none )

        Tick newTime ->
            ( { model | time = newTime }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Time.every 1000 Tick


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text model.message ]
        , button [ onClick GetMessage ] [ text "Call API!" ]
        , div [] [ text (HumanDateTimes.getDate model.time ++ " " ++ HumanDateTimes.getTime model.time ++ " UTC") ]
        ]


messageDecoder : Json.Decoder String
messageDecoder =
    Json.field "message" Json.string


getMessage : Cmd Msg
getMessage =
    Http.send MessageText <| Http.get "http://localhost:5050" messageDecoder
