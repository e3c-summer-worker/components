module MobileNav exposing (main)

import Browser
import Html exposing (Html, a, div, nav, text)
import Html.Attributes exposing (attribute, class, classList, href, id)
import Html.Events exposing (onClick)
import NavStructure exposing (..)
import Set exposing (Set)



---- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }



---- MODEL


type alias Model =
    { foldersOpened : Set String }


init : Model
init =
    { foldersOpened = Set.empty }



---- UPDATE


type Msg
    = ToggleClassname String



-- Toggle classname reacts to the click event on the folder link.


update : Msg -> Model -> Model
update (ToggleClassname folder) { foldersOpened } =
    if Set.member folder foldersOpened then
        { foldersOpened = Set.remove folder foldersOpened }

    else
        { foldersOpened = Set.insert folder foldersOpened }



---- VIEW


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
                        , onClick (ToggleClassname "About")
                        , classList [ ( "folder-toggle", True ), ( "active", Set.member "About" model.foldersOpened ) ]
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
                    , div [ class "collections" ]
                        [ a [ href "/jobs" ]
                            [ text "Careers" ]
                        ]
                    ]
                , div [ class "folder" ]
                    [ div
                        [ attribute "data-href" "/folder"
                        , onClick (ToggleClassname "JoinUs")
                        , classList [ ( "folder-toggle", True ), ( "active", Set.member "JoinUs" model.foldersOpened ) ]
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
                        , onClick (ToggleClassname "Community")
                        , classList [ ( "folder-toggle", True ), ( "active", Set.member "Community" model.foldersOpened ) ]
                        ]
                        [ text "Community" ]
                    , div [ class "subnav" ]
                        [ div [ class "collection" ]
                            [ a [ href "/smallgroups" ]
                                [ text "Small Groups" ]
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
                        , onClick (ToggleClassname "Resources")
                        , classList [ ( "folder-toggle", True ), ( "active", Set.member "Resources" model.foldersOpened ) ]
                        ]
                        [ text "Resources" ]
                    , div [ class "subnav" ]
                        [ div [ class "collection" ]
                            [ a [ href "https://drive.google.com/drive/folders/13Yj9ck9_EMYKBtM-F6mx3aa-szyW0ZRS?usp=sharing" ]
                                [ text "Docs/Forms" ]
                            ]
                        , div [ class "collection" ]
                            [ a [ href "/eng-external-resources" ]
                                [ text "External Resources" ]
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



-- same as DesktopNav, but the duplicate code isn't a lot anyway lol


viewDropdownItem : DropdownItem -> Html Never
viewDropdownItem navItem =
    div [ class "collection" ]
        [ a [ href navItem.link ]
            [ text navItem.name ]
        ]
