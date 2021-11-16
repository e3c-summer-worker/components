module MobileNavTest exposing (suite)

import Expect
import Html
import Html.Attributes as Attr
import MobileNav
import NavStructure exposing (navbar)
import Test exposing (Test)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


suite : Test
suite =
    Test.describe "MobileNav Test" [ headers ]


headers : Test
headers =
    Test.describe "Testing the Headers"
        [ headerCountTest
        , nonDropdownFormatTest
        , dropdownFormatTest
        ]


headerCountTest : Test
headerCountTest =
    Test.test "We have the correct amount of header elements" <|
        \_ ->
            initialModelView
                |> Query.fromHtml
                |> Query.findAll [ Selector.class "header-elem" ]
                |> Query.count (Expect.equal (List.length navbar))


dropdownFormatTest : Test
dropdownFormatTest =
    let
        dropdowns =
            List.filter (\( _, { dropdown } ) -> List.length dropdown > 0) navbar

        dropdownFormatTestIndividual ( name, data ) =
            MobileNav.viewNavbarItem initialModel ( name, data )
                |> Query.fromHtml
                |> Expect.all
                    [ -- making sure the classes is right
                      Query.has [ Selector.classes [ "header-elem", "folder" ] ]

                    -- making sure there is a data-href with the right text and name
                    -- I don't actually know why we use data-href
                    , Query.children []
                        >> Expect.all
                            [ -- checking the link
                              Query.first
                                >> Query.has
                                    [ Selector.class "folder-toggle"
                                    , Selector.attribute <| Attr.attribute "data-href" "/folder"
                                    , Selector.text name
                                    ]

                            -- checking navigation - if they are correct
                            -- not sure how I can check the text and link lol
                            , Query.index 1
                                >> Query.children []
                                >> Query.each
                                    (Query.has [ Selector.class "collection" ])
                            ]
                    ]
                -- make it a (\() -> a) function that can be piped into the test
                |> (\a ->
                        (\_ -> a)
                            |> Test.test ("Testing the format of an indidual non dropdown named " ++ name)
                   )
    in
    Test.describe "Check headers with dropdowns, making sure they have the right link and collection class"
        [ Test.test "Correct amount of dropdown elements" <|
            \_ ->
                initialModelView
                    |> Query.fromHtml
                    |> Query.findAll [ Selector.classes [ "header-elem", "folder" ] ]
                    |> Query.count (Expect.equal (List.length dropdowns))
        , Test.describe "Individual format tests for the dropdowns" <|
            List.map dropdownFormatTestIndividual dropdowns
        ]


nonDropdownFormatTest : Test
nonDropdownFormatTest =
    let
        nonDropdowns =
            List.filter (\( _, { dropdown } ) -> List.length dropdown == 0) navbar

        nonDropdownFormatTestIndividual ( name, data ) =
            MobileNav.viewNavbarItem initialModel ( name, data )
                |> Query.fromHtml
                |> Expect.all
                    [ -- making sure the classes is right
                      Query.has [ Selector.classes [ "header-elem", "collection" ] ]

                    -- making sure there is a link with the right text and name
                    , Query.contains
                        [ Html.a [ Attr.href data.link ]
                            [ Html.text name ]
                        ]

                    -- making sure there is not a "subnav"
                    , Query.hasNot [ Selector.tag "div", Selector.class "subnav" ]
                    ]
                -- make it a (\() -> a) function that can be piped into the test
                |> (\a ->
                        (\_ -> a)
                            |> Test.test ("Testing the format of an indidual non dropdown named " ++ name)
                   )
    in
    Test.describe "Check headers without dropdowns, making sure they have the right link and collection class"
        [ Test.test "Correct amount of non-dropdown elements" <|
            \_ ->
                initialModelView
                    |> Query.fromHtml
                    |> Query.findAll [ Selector.classes [ "header-elem", "collection" ] ]
                    |> Query.count (Expect.equal (List.length nonDropdowns))
        , Test.describe "Individual format tests for the non dropdowns" <|
            List.map nonDropdownFormatTestIndividual nonDropdowns
        ]


initialModel : MobileNav.Model
initialModel =
    MobileNav.init


initialModelView : Html.Html MobileNav.Msg
initialModelView =
    MobileNav.view initialModel
