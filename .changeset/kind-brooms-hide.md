---
"@e3c-summer-worker/homepage-ticker": major
---

HOMEPAGE TICKER VERSION 2 RC1:

- Huge backend changes (use webpack so I can have the banner), the debugging for elm-webpack-loader was horrendous
- in reality, we just change homepage-ticker-elm.js to ticker.js
- This also changes it so that we don't need to explicitly load elm in the header tag. I guess this is slightly easier.
