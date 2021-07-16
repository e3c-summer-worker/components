const { merge } = require('webpack-merge');
const common = require('./webpack.common.js');

// WARNING: libraries don't work for dev server for some reason

module.exports = merge(common, {
    mode: 'development',
    devtool: 'inline-source-map',
    devServer: {
        contentBase: path.join(__dirname, 'build'),
    }
});