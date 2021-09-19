module DesktopNav exposing (main)

import Browser
import Html exposing (Html, a, div, nav, text)
import Html.Attributes exposing (attribute, class, href, id)



-- MAIN


main : Program () Model Never
main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    ()


init : Model
init =
    ()



-- UPDATE


update : Never -> Model -> Model
update _ model =
    model



-- VIEW


view : Model -> Html Never
view _ =
    div [ id "headerNav" ]
        [ div [ class "nav-wrapper", attribute "data-content-field" "navigation-mainNav", id "mainNavWrapper" ]
            [ nav [ class "sqs-frontend-overlay-editor-widget-host", attribute "data-content-field" "navigation-mainNav", id "mainNavigation" ]
                [ div [ class "collection" ]
                    [ a [ href "/covid19" ]
                        [ text "COVID-19" ]
                    ]
                , div [ class "folder" ]
                    [ div [ class "folder-toggle", attribute "data-href" "/meet-the-team-1" ]
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
                    [ div [ class "folder-toggle", attribute "data-href" "/englishservice" ]
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
                    [ div [ class "folder-toggle", attribute "data-href" "/english-index" ]
                        [ text "Community" ]
                    , div [ class "subnav" ]
                        [ div [ class "collection" ]
                            [ a [ href "/smallgroups" ]
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
                , div [ attribute "class" "folder" ]
                    [ div [ class "folder-toggle", attribute "data-href" "/Resources" ]
                        [ text "Resources" ]
                    , div [ class "subnav" ]
                        [ div [ class "collection" ]
                            [ a [ href "https://drive.google.com/drive/folders/13Yj9ck9_EMYKBtM-F6mx3aa-szyW0ZRS?usp=sharing" ]
                                [ text "Docs/Forms      " ]
                            ]
                        ]
                    ]
                , div [ attribute "className" "collection" ]
                    [ a [ href "/give-now" ]
                        [ text "Give" ]
                    ]
                ]
            ]
        ]
