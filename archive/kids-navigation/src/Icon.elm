module Icon exposing (view)

import FeatherIcons exposing (Icon)
import Html exposing (Html)


view : Icon -> Html msg
view =
    FeatherIcons.withSize 32
        >> FeatherIcons.withStrokeWidth 2
        >> FeatherIcons.toHtml []
