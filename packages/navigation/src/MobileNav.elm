-- usually we expose only the main, but we're exposing everything for testing purposes.
module MobileNav exposing (..)

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
    { dropdownsOpen : Set String }


init : Model
init =
    { dropdownsOpen = Set.empty }



---- UPDATE


type Msg
    = ToggleDropdown String



-- Toggle classname reacts to the click event on the folder link.


update : Msg -> Model -> Model
update (ToggleDropdown folder) { dropdownsOpen } =
    if Set.member folder dropdownsOpen then
        { dropdownsOpen = Set.remove folder dropdownsOpen }

    else
        { dropdownsOpen = Set.insert folder dropdownsOpen }



---- VIEW


view : Model -> Html Msg
view model =
    div [ id "sidecarNav" ]
        [ div [ class "nav-wrapper sqs-frontend-overlay-editor-widget-host", attribute "data-content-field" "navigation-mobileNav", id "mobileNavWrapper" ]
            [ nav [ id "mobileNavigation" ] <|
                List.map (viewNavbarItem model) navbar
            ]
        ]


viewNavbarItem : Model -> ( String, NavbarItem ) -> Html Msg
viewNavbarItem { dropdownsOpen } ( name, navbarItem ) =
    case navbarItem.dropdown of
        [] ->
            div [ class "collection header-elem" ]
                [ a [ href navbarItem.link ]
                    [ text name ]
                ]

        dropdowns ->
            div [ class "folder header-elem" ]
                [ div
                    [ attribute "data-href" "/folder"
                    , onClick (ToggleDropdown name)
                    , classList [ ( "folder-toggle", True ), ( "active", Set.member name dropdownsOpen ) ]
                    ]
                    [ text name ]
                , div [ class "subnav" ] (List.map viewDropdownItem dropdowns)
                ]



-- same as DesktopNav, but the duplicate code isn't a lot anyway lol


viewDropdownItem : DropdownItem -> Html Msg
viewDropdownItem navItem =
    div [ class "collection" ]
        [ a [ href navItem.link ]
            [ text navItem.name ]
        ]
