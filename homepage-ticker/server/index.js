const index = require("./dist/index.js")

// no need for `app.listen()` on Deta, we run the app automatically.
module.exports = index.app; // make sure to export your `app` instance.npm