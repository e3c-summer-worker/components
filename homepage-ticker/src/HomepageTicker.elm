module HomepageTicker exposing (main)

import Browser
import DetaResponse exposing (DetaResponse)
import Html exposing (Html, a, div, nav, text)
import Html.Attributes exposing (attribute, class, href, id)
import Html.Events
import FeatherIcons
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
    | Success SuccessModel

type alias SuccessModel = 
    { response : DetaResponse
    , tickerOpen : Bool}

initSuccess : DetaResponse -> SuccessModel
initSuccess response =
    { response = response
    , tickerOpen = False }


init : () -> ( Model, Cmd Msg )
init () =
    ( Loading
    , Http.get
        { url = "https://q77r6a.deta.dev/sheet/1E7MW3HpJJNEtByxD2Ej55V60q9OU13t7rGy_le5FcTo"
        , expect = Http.expectJson GotDetaResponse DetaResponse.decoder
        }
    )



-- UPDATE


type Msg
    = GotDetaResponse (Result Http.Error DetaResponse)
    | ToggleTicker


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( model, msg ) of
        ( Loading, GotDetaResponse result ) ->
            case result of
                Ok content -> 
                    (Success <| initSuccess content, Cmd.none )

                Err error ->
                    ( Error error, Cmd.none )
        
        ( Success m, ToggleTicker ) ->
            ( Success <| { m | tickerOpen = not m.tickerOpen }
            , Cmd.none 
            )

        _ ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    case model of
        Loading ->
            div  [ class "ticker-wrap" ] []

        Error error ->
            div [] [ viewError error ]

        Success successModel ->
            div 
                []
                [ div 
            [ Html.Events.onClick ToggleTicker
            , Html.Attributes.style "mouse" "pointer"
            ]
            [ FeatherIcons.info
                |> FeatherIcons.toHtml []
            , text <| "Expand " ++ String.fromInt (successModel.response.size.rows) ++ " updates"
            ]
            , viewSuccess successModel 
                ]


viewSuccess : SuccessModel -> Html Msg 
viewSuccess successModel =
    if successModel.tickerOpen then
         div 
            [ class "ticker-wrap active" ] 
            [ viewContent successModel.response ]
    else 
        div [] []


viewContent : DetaResponse -> Html Msg
viewContent {rows} =
    div [ class "ticker" ] <|
        List.map (\(english, chinese) -> viewRow english chinese) rows


viewRow : String -> String -> Html Msg
viewRow english chinese =
    div 
        [ class "ticker__item" ]
        [ text english ]
    


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
