module BgAnimation exposing (..)

import Playground exposing (..)


view : Time -> List Shape
view time =
    [ lantern time
    ]


lantern : Time -> Shape
lantern time =
    Playground.group
        [ circle yellow (wave 25 50 5 time)
            |> fade (wave 0.5 0.2 5 time)
        , circle orange (wave 10 20 5 time)
        , rectangle grey 50 100
            |> fade 0.3
        ]
