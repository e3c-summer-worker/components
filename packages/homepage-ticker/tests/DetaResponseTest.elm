module DetaResponseTest exposing (suite)

import DetaResponse exposing (DetaResponse)
import Expect
import Json.Decode
import Test exposing (..)


source : String
source =
    """{"columnNames":["English","Chinese"],"key":"1E7MW3HpJJNEtByxD2Ej55V60q9OU13t7rGy_le5FcTo","lastModified":1636507781,"name":"Homepage Ticker","rows":[["Hello!","你好!"],["Important announcement 1","雪花飘飘北风萧萧"],["Important announcement 2","Super Idol 的笑容"]],"size":{"cols":2,"rows":3},"id":"1E7MW3HpJJNEtByxD2Ej55V60q9OU13t7rGy_le5FcTo"}"""


decoded : DetaResponse
decoded =
    { columnNames = [ "English", "Chinese" ]
    , key = "1E7MW3HpJJNEtByxD2Ej55V60q9OU13t7rGy_le5FcTo"
    , lastModified = 1636507781
    , name = "Homepage Ticker"
    , rows = [ ( "Hello!", "你好!" ), ( "Important announcement 1", "雪花飘飘北风萧萧" ), ( "Important announcement 2", "Super Idol 的笑容" ) ]
    , size = { cols = 2, rows = 3 }
    , id = "1E7MW3HpJJNEtByxD2Ej55V60q9OU13t7rGy_le5FcTo"
    }


suite : Test
suite =
    describe "the DetaResponse module"
        [ test "should parse the JSON correctly" <|
            \_ ->
                Expect.equal (Ok decoded) (Json.Decode.decodeString DetaResponse.decoder source)
        ]
