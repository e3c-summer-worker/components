module HomepageTicker exposing (main)

import Browser
import Html exposing (Html, a, div, nav, text)
import Html.Attributes exposing (attribute, class, href, id)



-- MAIN


main : Program () Model Msg
main =
    Browser.element { init = init, update = update, view = view, subscriptions = subscriptions }



-- MODEL


type alias Model =
    ()


init : () -> (Model, Cmd Msg)
init () =
    ((), Cmd.none)



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> (Model, Cmd Msg)
update _ model =
    (model, Cmd.none)



-- VIEW


view : Model -> Html Msg
view _ =
    div [ id "wrapper" ]
        [ text "Hello"]


---- SUBSCRIPTIONS 


subscriptions : Model -> Sub Msg
subscriptions _ = Sub.none