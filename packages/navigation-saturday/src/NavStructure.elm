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
      , { link = "/cantonese-covid19"
        , dropdown = []
        }
      )
    , ( "關於我們"
      , { link = "/cantonese-meet-the-team"
        , dropdown =
            [ { name = "教會同工"
              , link = "/cantonese-meet-the-team"
              }
            , { name = "歷史"
              , link = "/cantonese-history"
              }
            , { name = "信仰"
              , link = "/cantonese-what-we-believe"
              }
            , { name = "工作機會"
              , link = "/jobs"
              }
            ]
        }
      )
    , ( "加入我们"
      , { link = "/cantonese-service"
        , dropdown =
            [ { name = "主日崇拜"
              , link = "/cantonese-service"
              }
            , { name = "教會日曆"
              , link = "/cantonese-calendar"
              }
            , { name = "消息與活動"
              , link = "/cantonese-blog"
              }
            , { name = "E3C Connect"
              , link = "https://drive.google.com/drive/folders/1_cfpL4tmCzmzkm4oDtOhSXOF3uO7pBfK?usp=sharing"
              }
            ]
        }
      )
    , ( "會眾"
      , { link = "/cantonese-cell-groups"
        , dropdown =
            [ { name = "細胞小組"
              , link = "/cantonese-cell-groups"
              }
            ]
        }
      )
    , ( "資源"
      , { link = ""
        , dropdown =
            [ { name = "文件及表格"
              , link = "https://drive.google.com/drive/folders/13Yj9ck9_EMYKBtM-F6mx3aa-szyW0ZRS?usp=sharing"
              }
            ]
        }
      )
    , ( "奉獻"
      , { link = "/cantonese-give"
        , dropdown = []
        }
      )
    ]
