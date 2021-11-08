const path = require('path');

const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const devMode = process.env.NODE_ENV !== "production";



/**
 * Outputting everything to /build
 */
module.exports = {
    output: {
        path: path.join(__dirname, 'build'),
        filename: 'ticker.js'
    },
    module: {
        rules: [{
            test: /\.elm$/,
            exclude: [/elm-stuff/, /node_modules/],
            // Loading the custom elm-webpack-loader
            loader: './../elm-webpack-loader/index.js',
        }, {
            test: /\.scss$/,
            // https://webpack.js.org/loaders/css-loader/#recommend
            use: [
                devMode ? "style-loader" : MiniCssExtractPlugin.loader,
                'css-loader',
                'sass-loader',
            ],
        }],
    },
    devServer: {
        contentBase: path.join(__dirname, 'build'),
        stats: 'errors-only'
    },
    plugins: [].concat(devMode ? [] : [new MiniCssExtractPlugin()]),

};