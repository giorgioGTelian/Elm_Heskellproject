module Main exposing (main)

import Browser
import Html exposing (Html, div, text, img, style)
import Html.Attributes exposing (class)
import Html.Events exposing (onMouseOver, onMouseOut)
import Json.Decode exposing (Decoder, bool)

-- Define your application's model
type alias Model =
    { scrollEnabled : Bool }

-- Define the initial state of your model
initialModel : Model
initialModel =
    { scrollEnabled = False }

-- Define messages that your app can respond to
type Msg
    = EnableScroll
    | DisableScroll

-- Define how to update your model based on messages
update : Msg -> Model -> Model
update msg model =
    case msg of
        EnableScroll ->
            { model | scrollEnabled = True }

        DisableScroll ->
            { model | scrollEnabled = False }

-- Define how your model is turned into HTML
view : Model -> Html Msg
view model =
    div
        [ class "card-container"
        , onMouseOver (EnableScroll)
        , onMouseOut (DisableScroll)
        ]
        [ div [ class "card", style "scroll-behavior" (if model.scrollEnabled then "auto" else "none") ] [ text "Card Content" ]
        -- Repeat the above div for as many cards as you have
        ]

-- Define subscriptions for your app
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

-- Define the main entry point for your app
main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> ( initialModel, Cmd.none )
        , update = update
        , subscriptions = subscriptions
        , view = view
        }

-- CSS to add in the HTML file:
-- .card-container {
--     display: flex;
--     overflow-x: auto;
-- }
-- .card-container:hover {
--     scroll-behavior: smooth;
-- }
-- .card {
--     min-width: 200px;
--     margin: 10px;
--     padding: 20px;
--     border: 1px solid #ccc;
--     border-radius: 4px;
-- }
