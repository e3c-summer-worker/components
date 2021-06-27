module MobileNav exposing (main)

import Browser
import Html exposing (Html, a, div, nav, text)
import Html.Attributes exposing (attribute, class, href, id)



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    ()


init : Model
init =
    ()



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> Model
update _ model =
    model



-- VIEW


view : Model -> Html Msg
view _ =
    div [ id "sidecarNav" ]
        [ div [ class "nav-wrapper sqs-frontend-overlay-editor-widget-host", attribute "data-content-field" "navigation-mobileNav", id "mobileNavWrapper" ]
            [ nav [ id "mobileNavigation" ]
                [ div [ class "collection" ]
                    [ a [ href "/covid19" ]
                        [ text "COVID-19" ]
                    ]
                , div [ class "folder" ]
                    [ div [ class "folder-toggle", attribute "data-href" "/folder" ]
                        [ text "About" ]
                    , div [ class "subnav" ]
                        [ div [ class "collection" ]
                            [ a [ href "/meet-the-team-1" ]
                                [ text "Meet Our Team" ]
                            ]
                        , div [ class "collection" ]
                            [ a [ href "/history" ]
                                [ text "History" ]
                            ]
                        , div [ class "collection" ]
                            [ a [ href "/what-we-believe" ]
                                [ text "What We Believe" ]
                            ]
                        ]
                    ]
                , div [ class "folder" ]
                    [ div [ class "folder-toggle", attribute "data-href" "/folder" ]
                        [ text "Join Us" ]
                    , div [ class "subnav" ]
                        [ div [ class "collection" ]
                            [ a [ href "/englishservice" ]
                                [ text "Sunday Services" ]
                            ]
                        , div [ class "collection" ]
                            [ a [ href "/sunday-school" ]
                                [ text "Sunday School" ]
                            ]
                        , div [ class "collection" ]
                            [ a [ href "/english-calendar" ]
                                [ text "Calendar" ]
                            ]
                        , div [ class "collection" ]
                            [ a [ href "/englishupdates" ]
                                [ text "News and Updates" ]
                            ]
                        , div [ class "collection" ]
                            [ a [ href "https://drive.google.com/drive/folders/1_cfpL4tmCzmzkm4oDtOhSXOF3uO7pBfK?usp=sharing" ]
                                [ text "E3C Connect" ]
                            ]
                        ]
                    ]
                , div [ class "folder" ]
                    [ div [ class "folder-toggle", attribute "data-href" "/folder" ]
                        [ text "Community" ]
                    , div [ class "subnav" ]
                        [ div [ class "collection" ]
                            [ a [ href "/adult-cell-groups" ]
                                [ text "Adult Cell Groups" ]
                            ]
                        , div [ class "collection" ]
                            [ a [ href "/iwg" ]
                                [ text "IWG" ]
                            ]
                        , div [ class "collection" ]
                            [ a [ href "/life-support" ]
                                [ text "Life Support" ]
                            ]
                        , div [ class "collection" ]
                            [ a [ href "/petros" ]
                                [ text "Petros" ]
                            ]
                        , div [ class "collection" ]
                            [ a [ href "/samuel" ]
                                [ text "Samuel" ]
                            ]
                        , div [ class "collection" ]
                            [ a [ href "/eccc-kids" ]
                                [ text "ECCC Kids" ]
                            ]
                        ]
                    ]
                , div [ class "folder" ]
                    [ div [ class "folder-toggle", attribute "data-href" "/folder" ]
                        [ text "Resources" ]
                    , div [ class "subnav" ]
                        [ div [ class "collection" ]
                            [ a [ href "https://drive.google.com/drive/folders/13Yj9ck9_EMYKBtM-F6mx3aa-szyW0ZRS?usp=sharing" ]
                                [ text "Docs/Forms" ]
                            ]
                        ]
                    ]
                , div [ class "collection" ]
                    [ a [ href "/give-now" ]
                        [ text "Give" ]
                    ]
                ]
            ]
        ]
