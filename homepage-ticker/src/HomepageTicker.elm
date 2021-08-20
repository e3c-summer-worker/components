module HomepageTicker exposing (main)

import Browser
import Data.Content exposing (Content)
import Html exposing (Html, a, div, nav, text)
import Html.Attributes exposing (attribute, class, href, id)
import Http



-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- MODEL


type Model
    = Loading
    | Error Http.Error
    | Success (List Content)


init : () -> ( Model, Cmd Msg )
init () =
    ( Loading
    , Http.get
        { url = "https://4y7qfk.deta.dev/content"
        , expect = Http.expectJson GotContent Data.Content.decodeList
        }
    )



-- UPDATE


type Msg
    = GotContent (Result Http.Error (List Content))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( model, msg ) of
        ( Loading, GotContent result ) ->
            case result of
                Ok content ->
                    ( Success content, Cmd.none )

                Err error ->
                    ( Error error, Cmd.none )

        _ ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    case model of
        Loading ->
            div [] [ text "Loading..." ]

        Error error ->
            div [] [ viewError error ]

        Success contents ->
            div [ class "ticker" ] <|
                List.map (\content -> div [ class "ticker-item" ] [ viewContent content ]) contents


viewContent : Content -> Html Msg
viewContent content =
    div [ class "ticker-item" ] [ text content.english ]


viewError : Http.Error -> Html Msg
viewError error =
    case error of
        Http.BadUrl str ->
            div [ class "error" ] [ text "Bad URL", text str ]

        Http.Timeout ->
            div [ class "error" ] [ text "Timeout" ]

        Http.NetworkError ->
            div [ class "error" ] [ text "Network error" ]

        Http.BadStatus n ->
            div [ class "error" ] [ text "Bad status", text (String.fromInt n) ]

        Http.BadBody str ->
            div [ class "error" ] [ text "Bad body", text str ]



---- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
