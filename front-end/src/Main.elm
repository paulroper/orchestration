module Main exposing (Msg(..), main, update, view)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Http
import Json.Decode exposing (Decoder, field, string)


type alias Model =
    String


type Msg
    = GetMessage
    | MessageText (Result Http.Error String)


main =
    Browser.element { init = init, subscriptions = subscriptions, update = update, view = view }


init : () -> ( Model, Cmd Msg )
init _ =
    ( "Fetch a message from the API", Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetMessage ->
            ( "Loading...", getMessage )

        MessageText (Ok res) ->
            ( res, Cmd.none )

        MessageText (Err _) ->
            ( "Oh no!", Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text model ]
        , button [ onClick GetMessage ] [ text "Call API!" ]
        ]


messageDecoder : Decoder String
messageDecoder =
    field "message" string


getMessage : Cmd Msg
getMessage =
    Http.send MessageText <| Http.get "http://localhost:5050" messageDecoder
