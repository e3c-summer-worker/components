module MobileNav exposing (main)

import Browser
import Html exposing (Html, a, div, nav, text)
import Html.Attributes exposing (attribute, class, classList, href, id)
import Html.Events exposing (onClick)



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { aboutOpened : Bool
    , joinusOpened : Bool
    , communityOpened : Bool
    , resourcesOpened : Bool
    }


init : Model
init =
    { aboutOpened = False
    , joinusOpened = False
    , communityOpened = False
    , resourcesOpened = False
    }



-- UPDATE


type Msg
    = ToggleClassname Folder


type Folder
    = About
    | JoinUs
    | Community
    | Resources


update : Msg -> Model -> Model
update (ToggleClassname folder) model =
    case folder of
        About ->
            { model | aboutOpened = not model.aboutOpened }

        JoinUs ->
            { model | joinusOpened = not model.joinusOpened }

        Community ->
            { model | communityOpened = not model.communityOpened }

        Resources ->
            { model | resourcesOpened = not model.resourcesOpened }



-- VIEW


view : Model -> Html Msg
view model =
    div [ id "sidecarNav" ]
        [ div [ class "nav-wrapper sqs-frontend-overlay-editor-widget-host", attribute "data-content-field" "navigation-mobileNav", id "mobileNavWrapper" ]
            [ nav [ id "mobileNavigation" ]
                [ div [ class "collection" ]
                    [ a [ href "/covid19" ]
                        [ text "COVID-19" ]
                    ]
                , div [ class "folder" ]
                    [ div
                        [ attribute "data-href" "/folder"
                        , onClick (ToggleClassname About)
                        , classList [ ( "folder-toggle", True ), ( "active", model.aboutOpened ) ]
                        ]
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
                    [ div
                        [ attribute "data-href" "/folder"
                        , onClick (ToggleClassname JoinUs)
                        , classList [ ( "folder-toggle", True ), ( "active", model.joinusOpened ) ]
                        ]
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
                    [ div
                        [ attribute "data-href" "/folder"
                        , onClick (ToggleClassname Community)
                        , classList [ ( "folder-toggle", True ), ( "active", model.communityOpened ) ]
                        ]
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
                , div [ class "folder" ]
                    [ div
                        [ attribute "data-href" "/folder"
                        , onClick (ToggleClassname Resources)
                        , classList [ ( "folder-toggle", True ), ( "active", model.resourcesOpened ) ]
                        ]
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
