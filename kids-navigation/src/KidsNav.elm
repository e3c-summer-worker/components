module KidsNav exposing (main)

import Animator
import Animator.Css
import Browser
import Browser.Events
import Colours
import Element exposing (Element)
import Element.Events as Events
import Element.Font as Font
import FeatherIcons
import Html exposing (Html)
import Html.Attributes
import Html.Events
import Icon
import Time



---- APPLICATION


main : Program Flags Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



---- FLAGS


type alias Flags =
    { currentPage : String
    , width : Int
    }



---- MODEL


type alias Model =
    { open : Animator.Timeline Bool
    , currentPage : String
    , width : Int
    , activeLink : String -- which link to b blue ONLY ON MOBILE
    }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { open = Animator.init False
      , currentPage = flags.currentPage
      , width = flags.width
      , activeLink = ""
      }
    , Cmd.none
    )



---- VIEW


view : Model -> Html Msg
view model =
    content model
        |> Element.layout
            [ -- elm-live server doesn't have europa
              Font.family
                [ Font.typeface "europa" ]
            ]


content : Model -> Element Msg
content model =
    -- these are the same dimensions eccckids.com uses
    if model.width < 979 then
        mobileView model

    else
        desktopView model


mobileView : Model -> Element Msg
mobileView model =
    let
        icon =
            Element.el
                [ Element.centerX
                , Element.height (Element.px 60)
                , Events.onClick (ToggleOpen (not (Animator.current model.open)))
                , Element.pointer
                , Element.mouseOver
                    [ Font.color Colours.blue ]
                ]
                (Icon.view FeatherIcons.chevronDown)

        links =
            Animator.Css.div model.open
                [ Animator.Css.height <|
                    \open ->
                        if open then
                            -- 35px * 6 elements
                            Animator.at 210

                        else
                            Animator.at 0
                ]
                [ Html.Attributes.style "width" "100%"
                , Html.Attributes.style "overflow" "hidden"
                ]
                [ textBlockMobile model "HOME" "/home"
                , textBlockMobile model "ECCC KIDS CHURCH ONLINE" "/church-online"
                , textBlockMobile model "AWANA SPARKS (K-GR.2)" "/awana"
                , textBlockMobile model "KAIO FELLOWSHIP (GR.3-6)" "/kaio"
                , textBlockMobile model "JULY DAY CAMP" "/july-day-camp"
                , textBlockMobile model "UPDATES" "/updates"
                ]
                |> Element.html
    in
    Element.column
        [ Element.width Element.fill
        , Element.spacing 12
        ]
        [ icon, links ]


textBlockMobile : Model -> String -> String -> Html Msg
textBlockMobile { currentPage, activeLink } label url =
    let
        fontColour =
            if currentPage == label then
                Colours.blueHtml

            else if activeLink == label then
                Colours.blueHtml

            else
                "black"
    in
    Html.a
        [ Html.Attributes.style "display" "block"
        , Html.Attributes.style "width" "fill"
        , Html.Attributes.style "line-height" "35px"
        , Html.Attributes.style "font-size" "15px"
        , Html.Attributes.style "text-align" "center"
        , Html.Attributes.style "color" fontColour
        , Html.Attributes.style "cursor" "pointer"
        , Html.Attributes.href url
        , Html.Events.onMouseOver (ActivateLink label)
        ]
        [ Html.text label ]


desktopView : Model -> Element Msg
desktopView model =
    Element.wrappedRow
        [ Element.width Element.fill
        , Font.size 16
        ]
        [ textBlockDesktop model.currentPage "HOME" "/home"
        , textBlockDesktop model.currentPage "ECCC KIDS CHURCH ONLINE" "/church-online"
        , textBlockDesktop model.currentPage "AWANA SPARKS (K-GR.2)" "/awana"
        , textBlockDesktop model.currentPage "KAIO FELLOWSHIP (GR.3-6)" "/kaio"
        , textBlockDesktop model.currentPage "JULY DAY CAMP" "/july-day-camp"
        , textBlockDesktop model.currentPage "UPDATES" "/updates"
        ]


textBlockDesktop : String -> String -> String -> Element Msg
textBlockDesktop currentPage label url =
    Element.link
        [ Element.height (Element.px 60)
        , Element.paddingXY 10 0

        -- Center wrapped row elements
        -- https://stackoverflow.com/a/59813198
        , Element.htmlAttribute (Html.Attributes.style "marginLeft" "auto")
        , Element.htmlAttribute (Html.Attributes.style "marginRight" "auto")
        , Font.color <|
            if currentPage == label then
                Colours.blue

            else
                Element.rgb 0 0 0
        , Element.mouseOver
            [ Font.color Colours.blue ]
        ]
        { url = url
        , label = Element.el [ Element.centerY ] <| Element.text label
        }



---- MSG


type Msg
    = Tick Time.Posix
    | ToggleOpen Bool
    | UpdateWidth Int
    | ActivateLink String -- mobile stuff


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick newTime ->
            ( model
                |> Animator.update newTime animator
              -- (5) - Updating our model using our animator and the current time.
            , Cmd.none
            )

        ToggleOpen newChecked ->
            ( { model
                | open =
                    -- (6) - Here we're adding a new state to our timeline.
                    model.open
                        |> Animator.go Animator.slowly newChecked
              }
            , Cmd.none
            )

        UpdateWidth newWidth ->
            ( { model | width = newWidth }, Cmd.none )

        ActivateLink link ->
            ( { model | activeLink = link }, Cmd.none )



---- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Browser.Events.onResize (\w _ -> UpdateWidth w)
        , -- (4) - turning out Animator into a subscription
          -- this is where the animator will decide to have a subscription to AnimationFrame or not.
          animator
            |> Animator.toSubscription Tick model
        ]



-- animator


animator : Animator.Animator Model
animator =
    Animator.animator
        |> Animator.watching
            -- we tell the animator how
            -- to get the checked timeline using .checked
            .open
            -- and we tell the animator how
            -- to update that timeline as well
            (\newOpened model ->
                { model | open = newOpened }
            )
