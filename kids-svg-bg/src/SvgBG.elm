module SvgBG exposing (main)

import BgAnimation
import Browser
import Html exposing (Html)
import Html.Attributes
import Playground



---- APPLICATION


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



---- MODEL


type alias Model =
    { animation : Playground.Animation }


init : ( Model, Cmd Msg )
init =
    ( { animation = Playground.initAnimation }
    , Cmd.none
    )



---- VIEW


view : Model -> Html Msg
view model =
    Html.figure
        [ Html.Attributes.id "thumbnail"
        , Html.Attributes.class "loading content-fill"
        , Html.Attributes.style "background-color" "white"
        , Html.Attributes.style "height" "500px"
        ]
        [ Playground.viewAnimation model.animation BgAnimation.view
            |> Html.map PlaygroundMsg
        ]



---- UPDATE


type Msg
    = PlaygroundMsg Playground.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PlaygroundMsg subMsg ->
            ( { model | animation = Playground.updateAnimation subMsg model.animation }
            , Cmd.none
            )



---- SUSBCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.map PlaygroundMsg (Playground.subscriptionsAnimation model.animation)
