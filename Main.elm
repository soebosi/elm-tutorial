import Html exposing (Html, button, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)

main =
  Html.beginnerProgram { model = model, view = view, update = update}

type alias Model =
  { counter: Int
  , content: String
  }

model : Model
model =
  { counter = 0
  , content = ""
  }

type Msg =
  Increment
  | Decrement
  | Change String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change str ->
      { model | content = str }
    Increment ->
      { model | counter = model.counter + 1 }
    Decrement ->
      { model | counter = model.counter - 1 }

view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString model.counter) ]
    , button [ onClick Increment ] [ text "+" ]
    , input [ placeholder "Text to reverse", onInput Change] []
    , div [] [ text (toString model.content) ]
    ]

