import AltHtml exposing (..)


main =
  beginnerProgram
    { model = model
    , view = view
    , update = update
    }



-- MODEL


type alias Model =
  { count1 : Int
  , count2 : Int
  , count3 : Int
  }


model : Model
model =
  Model 0 0 0



-- UPDATE


type Msg
    = Increment Int


update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment 1 ->
      { model | count1 = model.count1 + 1 }

    Increment 2 ->
      { model | count2 = model.count2 + 1 }

    Increment three ->
      { model | count3 = model.count3 + 1 }



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ box model.count1 |> map ((|>) 1)
    , br [] []
    , lazy box model.count2 |> map ((|>) 2)
    , text "lazy"
    , br [] []
    , lazy box2 (model.count3, 0) |> map ((|>) 3) -- unexpected leak
    , text "lazy (unexpectedly not working)"
    , br [] []
    , hr [] []
    , ul []
        [ li [] [ text "solid red: rendered" ]
        , li [] [ text "dashed green: not rendered, and lazy succeeded" ]
        , li [] [ text "dashed red: not rendered, and lazy failed" ]
        ]
    ]


box : Int -> Html (Int -> Msg)
box count =
  div
    [ onClick Increment
    , style
        [ ("background-color", "#cdb")
        , ("width", "100px")
        , ("height", "100px")
        , ("margin", "30px")
        , ("text-align", "center")
        , ("line-height", "100px")
        , ("display", "inline-block")
        ]
    ]
    [ text (toString count)
    ]


box2 : (Int, Int) -> Html (Int -> Msg)
box2 (count, _) =
  box count
