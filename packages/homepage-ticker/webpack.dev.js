const { merge } = require('webpack-merge');
const common = require('./webpack.common.js');
const path = require('path')


module.exports = merge(common, {
    mode: 'development',
    devtool: 'inline-source-map',
    watch: true,
    // we serve from `build` folder, since this is where we get the actual stuff from.
    devServer: {
        contentBase: path.join(__dirname, 'build'),
    },
    module: {
        rules: [{
            test: /\.scss$/,
            // https://webpack.js.org/loaders/css-loader/#recommend
            use: [
                'style-loader',
                'css-loader',
                'sass-loader',
            ],
        }]
    },
});
