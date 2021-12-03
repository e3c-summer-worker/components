-- usually we expose only the main, but we're exposing everything for testing purposes.
module DesktopNav exposing (..)

import Browser
import Html exposing (Html, a, div, nav, text)
import Html.Attributes exposing (attribute, class, href, id)
import NavStructure exposing (..)



---- MAIN


main : Program () Model Never
main =
    Browser.sandbox { init = init, update = update, view = view }



---- MODEL


type alias Model =
    ()


init : Model
init =
    ()



---- UPDATE


update : Never -> Model -> Model
update _ model =
    model



---- VIEW
-- note that this view will never react to any messages (such as user input), that's why it's an Html Never


view : Model -> Html Never
view _ =
    div [ id "headerNav" ]
        [ div 
            [ class "nav-wrapper"
            , attribute "data-content-field" "navigation-mainNav"
            , id "mainNavWrapper" 
            ]
            [ nav
                [ class "sqs-frontend-overlay-editor-widget-host"
                , attribute "data-content-field" "navigation-mainNav"
                , id "mainNavigation"
                ]
              <|
                List.map viewNavbarItem navbar
            ]
        ]


viewNavbarItem : ( String, NavbarItem ) -> Html Never
viewNavbarItem ( name, navbarItem ) =
    case navbarItem.dropdown of
        [] ->
            div [ class "collection header-elem" ]
                [ a [ href navbarItem.link ]
                    [ text name ]
                ]

        dropdowns ->
            div [ class "folder header-elem" ]
                [ div [ class "folder-toggle", attribute "data-href" navbarItem.link ]
                    [ text name ]
                , div [ class "subnav" ]
                    (List.map viewDropdownItem dropdowns)
                ]


viewDropdownItem : DropdownItem -> Html Never
viewDropdownItem navItem =
    div [ class "collection" ]
        [ a [ href navItem.link ]
            [ text navItem.name ]
        ]
