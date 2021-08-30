const { merge } = require('webpack-merge');
const common = require('./webpack.common.js');

module.exports = merge(common, {
    mode: 'production',
    // https://webpack.js.org/guides/production/#source-mapping
    devtool: 'source-map',
    output: {
        filename: 'scrolling-terrain.min.js'
    }
});