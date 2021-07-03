module KidsNav exposing (main)

import Animator
import Animator.Css
import Browser
import Browser.Events
import Colours
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
    -- these are the same dimensions eccckids.com uses
    if model.width < 979 then
        mobileView model

    else
        desktopView model


mobileView : Model -> Html Msg
mobileView model =
    let
        icon =
            Html.div
                [ Html.Events.onClick (ToggleOpen (not (Animator.current model.open)))
                , Html.Attributes.style "cursor" "pointer"
                , Html.Attributes.style "height" "60px"
                , Html.Attributes.style "display" "grid"
                , Html.Attributes.style "justify-content" "center"
                , Html.Attributes.style "align-items" "center"
                ]
                [ Icon.view FeatherIcons.chevronDown ]

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
                [ textBlockMobile model "HOME" "https://eccchurch.ca/kids/"
                , textBlockMobile model "ECCC KIDS CHURCH ONLINE" "https://eccchurch.ca/kids/church-online"
                , textBlockMobile model "AWANA SPARKS (K-GR.2)" "https://eccchurch.ca/kids/awana"
                , textBlockMobile model "KAIO FELLOWSHIP (GR.3-6)" "https://eccchurch.ca/kids/kaio"
                , textBlockMobile model "JULY DAY CAMP" "https://eccchurch.ca/kids/july-day-camp"
                , textBlockMobile model "UPDATES" "https://eccchurch.ca/kids/updates"
                ]
    in
    Html.div
        [ Html.Attributes.style "height" "fill"
        , Html.Attributes.style "display" "grid"
        , Html.Attributes.style "gap" "12px"
        ]
        [ icon, links ]


textBlockMobile : Model -> String -> String -> Html Msg
textBlockMobile { currentPage, activeLink } label url =
    let
        fontColour =
            if currentPage == label || activeLink == label then
                Colours.blue

            else
                "black"
    in
    Html.a
        [ Html.Attributes.style "display" "block"
        , Html.Attributes.style "width" "fill"
        , Html.Attributes.style "line-height" "35px"
        , Html.Attributes.style "font-size" "15px"
        , Html.Attributes.style "text-align" "center"
        , Html.Attributes.style "font-weight" "bold"
        , Html.Attributes.style "color" fontColour
        , Html.Attributes.style "cursor" "pointer"
        , Html.Attributes.href url
        , Html.Events.onMouseOver (ActivateLink label)
        ]
        [ Html.text label ]


desktopView : Model -> Html Msg
desktopView model =
    Html.div
        [ Html.Attributes.style "display" "flex"
        , Html.Attributes.style "flex-wrap" "wrap"
        ]
        [ textBlockDesktop model.currentPage "HOME" "https://eccchurch.ca/kids/"
        , textBlockDesktop model.currentPage "ECCC KIDS CHURCH ONLINE" "https://eccchurch.ca/kids/church-online"
        , textBlockDesktop model.currentPage "AWANA SPARKS (K-GR.2)" "https://eccchurch.ca/kids/awana"
        , textBlockDesktop model.currentPage "KAIO FELLOWSHIP (GR.3-6)" "https://eccchurch.ca/kids/kaio"
        , textBlockDesktop model.currentPage "JULY DAY CAMP" "https://eccchurch.ca/kids/july-day-camp"
        , textBlockDesktop model.currentPage "UPDATES" "https://eccchurch.ca/kids/updates"
        ]


textBlockDesktop : String -> String -> String -> Html Msg
textBlockDesktop currentPage label url =
    Html.a
        [ Html.Attributes.style "height" "60px"

        -- bit of a hacky way to vertically align text
        , Html.Attributes.style "line-height" "60px"
        , Html.Attributes.style "padding" "10 0" -- x and y
        , Html.Attributes.style "font-weight" "bold"

        -- Center wrapped row elements
        -- https://stackoverflow.com/a/59813198
        , Html.Attributes.style "marginLeft" "auto"
        , Html.Attributes.style "marginRight" "auto"
        , Html.Attributes.style "color" <|
            if currentPage == label then
                Colours.blue

            else
                "rgb(0,0,0)"
        , Html.Attributes.href url
        ]
        [ Html.text label ]



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
