module DetaResponse exposing (DetaResponse, decoder)

-- This data is the response we get from the server

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Pipeline



---- TYPE


type alias DetaResponse =
    { size : Size
    , columnNames : List String
    , lastModified : Int
    , rows : List Row
    , key : String
    , name : String
    , id : String
    }



-- row can technically be any length, but we only need thr first two


type alias Row =
    ( String, String )


type alias Size =
    { cols : Int
    , rows : Int
    }



---- DECODER


decoder : Decoder DetaResponse
decoder =
    Decode.succeed DetaResponse
        |> Pipeline.required "size" sizeDecoder
        |> Pipeline.required "columnNames" (Decode.list Decode.string)
        |> Pipeline.required "lastModified" Decode.int
        |> Pipeline.required "rows" (Decode.list decodeTuple)
        |> Pipeline.required "key" Decode.string
        |> Pipeline.required "name" Decode.string
        |> Pipeline.required "id" Decode.string


decodeTuple : Decoder Row
decodeTuple =
    Decode.map2 Tuple.pair
        (Decode.index 0 Decode.string)
        (Decode.index 1 Decode.string)


sizeDecoder : Decoder Size
sizeDecoder =
    Decode.succeed Size
        |> Pipeline.required "cols" Decode.int
        |> Pipeline.required "rows" Decode.int
