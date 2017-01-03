import AltHtml exposing (..)


main =
  beginnerProgram
    { model = model
    , view = view
    , update = update
    }



-- MODEL


type alias Model =
  { count : Int
  }


model : Model
model =
  { count = 0 }



-- UPDATE


type Msg
    = Increment


update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      { count = model.count + 1 }



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ box model.count
    , lazy box 0
    , box 0
    , button [ onClick Increment ] [ text "Increment" ]
    ]


box : Int -> Html msg
box count =
  div
    [ style
        [ ("background-color", "#cdb")
        , ("width", "100px")
        , ("height", "100px")
        , ("margin-bottom", "5px")
        , ("text-align", "center")
        , ("line-height", "100px")
        ]
    ]
    [ text (toString count)
    ]
