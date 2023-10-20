import Browser
module Template exposing (..)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

view : Html msg
view =
    div []
        [ h1 [] [ text "Welcome to my template page!" ]
        , p [] [ text "This is an example template page." ]
        ]

main =
  Browser.sandbox { init = 0, update = update, view = view }

update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1

view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (String.fromInt model) ]
    , button [ onClick Increment ] [ text "+" ]
    ]
type Msg = Increment | Decrement