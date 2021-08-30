const { merge } = require('webpack-merge');
const common = require('./webpack.common.js');
const path = require('path')

// WARNING: libraries don't work for dev server for some reason

module.exports = merge(common, {
    mode: 'development',
    devtool: 'inline-source-map',
    watch: true,
    devServer: {
        contentBase: path.join(__dirname, 'build'),
    }
});