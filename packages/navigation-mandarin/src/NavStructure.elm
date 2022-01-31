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
      , { link = "/mandarin-covid19"
        , dropdown = []
        }
      )
    , ( "关于我们"
      , { link = "/mandarin-meet-the-team"
        , dropdown =
            [ { name = "教会同工"
              , link = "/mandarin-meet-the-team"
              }
            , { name = "历史"
              , link = "/mandarin-history"
              }
            , { name = "信仰"
              , link = "/mandarin-what-we-believe"
              }
            , { name = "工作机会"
              , link = "/jobs"
              }
            ]
        }
      )
    , ( "加入我们"
      , { link = "mandarin-service"
        , dropdown =
            [ { name = "主日崇拜"
              , link = "/mandarin-service"
              }
            , { name = "教会日历"
              , link = "/mandarin-calendar"
              }
            , { name = "消息与活动"
              , link = "/mandarin-blog"
              }
            , { name = "E3C Connect"
              , link = "https://drive.google.com/drive/folders/1mABcHZIbX203A5oRcPeomygZMQD-_3A6?usp=sharing"
              }
            ]
        }
      )
    , ( "会众"
      , { link = "/mandarin-cell-groups"
        , dropdown =
            [ { name = "细胞小组"
              , link = "/mandarin-cell-groups"
              }
            , { name = "NextGen"
              , link = "/nextgen"
              }
            ]
        }
      )
    , ( "资源"
      , { link = "" -- no link
        , dropdown =
            [ { name = "文件及表格"
              , link = "https://drive.google.com/drive/folders/13Yj9ck9_EMYKBtM-F6mx3aa-szyW0ZRS?usp=sharing"
              }
            ]
        }
      )
    , ( "奉献"
      , { link = "/mandarin-give"
        , dropdown = []
        }
      )
    ]
