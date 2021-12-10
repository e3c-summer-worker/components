---
"elm-webpack-loader": patch
---

# Fix race condition

This fixes [Issue #38](https://github.com/e3c-summer-worker/components/issues/38), where race conditions in the Navigation folder was *sometimes* messing up the builds.

Fixed after condulting [the solution in Elm Snowpack Plugin](https://github.com/marc136/snowpack-plugin-elm/commit/d8b2e37). Also left a comment in the [Elm Webpack Loader repo](https://github.com/elm-community/elm-webpack-loader/issues/211).
