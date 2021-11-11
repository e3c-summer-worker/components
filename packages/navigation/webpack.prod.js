const { merge } = require('webpack-merge');
const common = require('./webpack.common.js');
const TerserPlugin = require("terser-webpack-plugin");


// adds version number to the top of the build file
// https://stackoverflow.com/a/34799996
var PACKAGE = require('./package.json');
var banner = '/* ' + PACKAGE.name + ' - ' + PACKAGE.version + ' */';


// customizing the terser plugin to add a banner to the top of the file
// https://github.com/terser/terser#minify-options
const minimizer = new TerserPlugin({
    terserOptions: {
        format: {
            preamble: banner
        }
    }
})


module.exports = merge(common, {
    mode: 'production',
    // https://webpack.js.org/guides/production/#source-mapping
    devtool: 'source-map',
    optimization: {
        minimizer: [minimizer],
    }
});
