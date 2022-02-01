module NavStructure exposing (..)

{-| Navigation Structure

    I could have used a JSON file, but putting this in an .elm file makes it more type safe.

    Each Navigation bar element (the links displayed on top) has the unique identifier (the name)
    and a link to the page it points to.
    It can also have a sub-navigation bar, or a list of its dropdown elements

    What's weird is that the navbarItem links are usually the same as the first link in its dropdown
    Except for Community, which links to the English index. I initially wanted to make each dropdown file EITHER a link or a dropdown,
    but we have to include both.

    It is also worth noting that the mobile navbar will ignore the NavbarItem links, unless there is no dropdown

-}


type alias NavStructure =
    List ( String, NavbarItem )


type alias NavbarItem =
    { link : String
    , dropdown : List DropdownItem
    }


type alias DropdownItem =
    { name : String
    , link : String
    }


navbar : NavStructure
navbar =
    [ ( "COVID-19"
      , { link = "/covid19"
        , dropdown = []
        }
      )
    , ( "About"
      , { link = "/meet-the-team-1"
        , dropdown =
            [ { name = "Meet Our Team"
              , link = "/meet-the-team-1"
              }
            , { name = "History"
              , link = "/history"
              }
            , { name = "What we Believe"
              , link = "/what-we-believe"
              }
            , { name = "Careers"
              , link = "/jobs"
              }
            ]
        }
      )
    , ( "Join Us"
      , { link = "englishservice"
        , dropdown =
            [ { name = "Sunday Service"
              , link = "/englishservice"
              }
            , { name = "Sunday School"
              , link = "/sunday-school"
              }
            , { name = "Next Gen (Kids & Youth)"
              , link = "/nextgen"
              }
            , { name = "Calendar"
              , link = "/english-calendar"
              }
            , { name = "News and Updates"
              , link = "/englishupdates"
              }
            , { name = "E3C Connect"
              , link = "https://drive.google.com/drive/folders/1_cfpL4tmCzmzkm4oDtOhSXOF3uO7pBfK?usp=sharing"
              }
            ]
        }
      )
    , ( "Community"
      , { link = "/english-index"
        , dropdown =
            [ { name = "Small Groups"
              , link = "/smallgroups"
              }
            , { name = "IWG"
              , link = "/iwg"
              }
            , { name = "Life Support"
              , link = "/life-support"
              }
            , { name = "Petros"
              , link = "/petros"
              }
            , { name = "Samuel"
              , link = "/samuel"
              }
            ]
        }
      )
    , ( "Resources"
      , { link = "" -- no link
        , dropdown =
            [ { name = "Docs and Forms"
              , link = "https://drive.google.com/drive/folders/13Yj9ck9_EMYKBtM-F6mx3aa-szyW0ZRS?usp=sharing"
              }
            , { name = "External Resources"
              , link = "/eng-external-resources"
              }
            ]
        }
      )
    , ( "Give"
      , { link = "/give-now"
        , dropdown = []
        }
      )
    ]
