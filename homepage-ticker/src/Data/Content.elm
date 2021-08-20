module Data.Content exposing (Content, decodeList)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Pipeline


type alias Content =
    { english : String
    , chinese : String
    }


decodeList : Decoder (List Content)
decodeList =
    Decode.list decode


decode : Decoder Content
decode =
    Decode.succeed Content
        |> Pipeline.required "english" Decode.string
        |> Pipeline.required "chinese" Decode.string
