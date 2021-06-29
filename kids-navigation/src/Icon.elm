module Icon exposing (view)

import Element exposing (Element)
import FeatherIcons exposing (Icon)


view : Icon -> Element msg
view =
    FeatherIcons.withSize 32
        >> FeatherIcons.withStrokeWidth 2
        >> FeatherIcons.toHtml []
        >> Element.html
