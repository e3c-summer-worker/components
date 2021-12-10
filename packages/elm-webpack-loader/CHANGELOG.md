# elm-webpack-loader

## 8.1.2

### Patch Changes

- 25cd35b: # Fix race condition

  This fixes [Issue #38](https://github.com/e3c-summer-worker/components/issues/38), where race conditions in the Navigation folder was _sometimes_ messing up the builds.

  Fixed after condulting [the solution in Elm Snowpack Plugin](https://github.com/marc136/snowpack-plugin-elm/commit/d8b2e37). Also left a comment in the [Elm Webpack Loader repo](https://github.com/elm-community/elm-webpack-loader/issues/211).

## 8.0.1

### Patch Changes

- Add changelog thing so it will stop being in the "changed packages" when I run `yarn changeset`
