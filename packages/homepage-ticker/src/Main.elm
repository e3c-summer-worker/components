module Main exposing (main)

import Browser
import DetaResponse exposing (DetaResponse)
import FeatherIcons
import Html exposing (Html, div, text)
import Html.Attributes exposing (class, id)
import Html.Events
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
    , tickerOpen : Bool
    , english : Bool -- english or chinese
    , paused : Bool -- whether the thing is stopped or not
    }


initSuccess : DetaResponse -> SuccessModel
initSuccess response =
    { response = response
    , tickerOpen = True
    , english = True
    , paused = False
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Loading
    , Http.get
        { url = "https://api.sheets.eccchurch.ca/sheet/1E7MW3HpJJNEtByxD2Ej55V60q9OU13t7rGy_le5FcTo"
        , expect = Http.expectJson GotDetaResponse DetaResponse.decoder
        }
    )



-- UPDATE


type Msg
    = GotDetaResponse (Result Http.Error DetaResponse)
    | ToggleTicker
    | ToggleLanguage
    | TogglePlayPause


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( model, msg ) of
        ( Loading, GotDetaResponse result ) ->
            case result of
                Ok content ->
                    ( Success <| initSuccess content, Cmd.none )

                Err error ->
                    ( Error error, Cmd.none )

        ( Success m, ToggleTicker ) ->
            ( Success <| { m | tickerOpen = not m.tickerOpen }
            , Cmd.none
            )

        ( Success m, ToggleLanguage ) ->
            ( Success <| { m | english = not m.english }
            , Cmd.none
            )

        ( Success m, TogglePlayPause ) ->
            ( Success <| { m | paused = not m.paused }
            , Cmd.none
            )

        _ ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    case model of
        Loading ->
            div [ class "loading", id "elm" ] [ buttons model ]

        Error error ->
            div [ class "error", id "elm" ] [ viewError error ]

        Success successModel ->
            div
                [ Html.Attributes.class "sqs-slice yui3-widget ticker-wrapper", id "elm" ]
                [ buttons model
                , viewSuccess successModel
                ]



-- ensures that the buttons will still be there, even when we're loading


buttons : Model -> Html Msg
buttons model =
    let
        actionText =
            case model of
                Success m ->
                    if m.tickerOpen then
                        "Hide"

                    else
                        "Show"

                -- default to "hide" because that's what we initialize it to be anyway
                _ ->
                    "Hide"
    in
    div
        [ Html.Attributes.class "ticker-toggle-wrapper" ]
        [ div
            [ Html.Events.onClick ToggleTicker
            , Html.Attributes.class "ticker-toggle-btn"
            ]
            [ -- NOTE: If you change the size, also change the code in ticker.scss that unfortunately hardcodes the icon size
              FeatherIcons.info
                |> FeatherIcons.withSize 18
                |> FeatherIcons.toHtml []
                |> List.singleton
                |> Html.div [ Html.Attributes.class "ticker-toggle-btn-icon" ]
            , Html.p
                [ Html.Attributes.class "ticker-toggle-btn-txt unselectable" ]
                [ text <| actionText ++ " updates" ]
            ]

        -- toggles language
        , FeatherIcons.globe
            |> FeatherIcons.withSize 18
            |> FeatherIcons.toHtml []
            |> List.singleton
            |> Html.div
                [ Html.Attributes.class "ticker-btn-globe-icon"
                , Html.Events.onClick ToggleLanguage
                ]
        ]


viewSuccess : SuccessModel -> Html Msg
viewSuccess successModel =
    if successModel.tickerOpen then
        div
            [ class "ticker-wrap"
            , Html.Events.onClick TogglePlayPause
            ]
            [ viewTicker successModel successModel.english ]

    else
        div [] []



-- this is the thing that actually moves


viewTicker : SuccessModel -> Bool -> Html Msg
viewTicker { response, paused } isEnglish =
    let
        pausedClass =
            if paused then
                "paused"

            else
                ""
    in
    div [ class ("ticker " ++ pausedClass) ] <|
        List.map (\( english, chinese ) -> viewRow english chinese isEnglish) response.rows


viewRow : String -> String -> Bool -> Html Msg
viewRow english chinese isEnglish =
    let
        rowText =
            if isEnglish then
                english

            else
                chinese
    in
    div
        [ class "ticker__item" ]
        [ text rowText ]


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
