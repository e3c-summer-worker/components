module NavStructure exposing (..)

import Dict exposing (Dict)


{-| Navigation Structure

    I could have used a JSON file, but putting this in an .elm file makes it more type safe.

    Each Navigation bar element (the links displayed on top) has the unique identifier (the name)
    and a link to the page it points to.
    It can also have a sub-navigation bar, or a list of its dropdown elements

    What's weird is that the navbarItem links are usually the same as the first link in its dropdown
    Except for Community, which links to the English index

    It is also worth noting that the mobile navbar will ignore the NavbarItem links, unless there is no dropdown

-}
type alias NavStructure =
    Dict String NavbarItem


type alias NavbarItem =
    { link : String
    , dropdown : List NavItem
    }


type alias NavItem =
    { name : String
    , url : String
    }


navbar : NavStructure
navbar =
    Dict.fromList
        [ ( "COVID-19"
          , { link = "/covid19"
            , dropdown = []
            }
          )
        , ( "About"
          , { link = "/meet-the-team-1"
            , dropdown =
                [ { name = "Meet Our Team"
                  , url = "/meet-the-team-1"
                  }
                , { name = "History"
                  , url = "/history"
                  }
                , { name = "What we Believe"
                  , url = "/what-we-believe"
                  }
                , { name = "Careers"
                  , url = "/jobs"
                  }
                ]
            }
          )
        , ( "Join Us"
          , { link = "englishservice"
            , dropdown =
                [ { name = "Sunday Service"
                  , url = "/englishservice"
                  }
                , { name = "Sunday School"
                  , url = "/sunday-school"
                  }
                , { name = "Calendar"
                  , url = "/english-calendar"
                  }
                , { name = "News and Updates"
                  , url = "/englishupdates"
                  }
                , { name = "E3C Connect"
                  , url = "https://drive.google.com/drive/folders/1_cfpL4tmCzmzkm4oDtOhSXOF3uO7pBfK?usp=sharing"
                  }
                ]
            }
          )
        , ( "Community"
          , { link = "/english-index"
            , dropdown =
                [ { name = "Small Groups", url = "/smallgroups" }
                , { name = "IWG", url = "/iwg" }
                , { name = "Life Support", url = "/life-support" }
                , { name = "Petros", url = "/petros" }
                , { name = "Samuel", url = "/samuel" }
                , { name = "ECCC Kids", url = "/kids" }
                ]
            }
          )
        , ( "Resources"
          , { link = "/Resources"
            , dropdown =
                [ { name = "Docs/Forms", url = "https://drive.google.com/drive/folders/13Yj9ck9_EMYKBtM-F6mx3aa-szyW0ZRS?usp=sharing" }
                , { name = "External Resources", url = "/eng-external-resources" }
                ]
            }
          )
        , ( "Give"
          , { link = "/give-now"
            , dropdown = []
            }
          )
        ]
