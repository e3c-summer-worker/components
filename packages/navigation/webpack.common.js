const path = require('path');

const { CleanWebpackPlugin } = require('clean-webpack-plugin');



/**
 * Outputting everything to /build
 */
module.exports = {
    entry: ['./src/desktop.js', './src/mobile.js'],
    output: {
        path: path.join(__dirname, 'build'),
        filename: 'navigation.js'
    },
    module: {
        // scss rules are split between dev and prod
        rules: [{
            test: /\.elm$/,
            exclude: [/elm-stuff/, /node_modules/],
            // Loading the custom elm-webpack-loader
            loader: './../elm-webpack-loader/index.js',
        }],
    },
    devServer: {
        contentBase: path.join(__dirname, 'build'),
        stats: 'errors-only'
    },
    plugins: [
        new CleanWebpackPlugin()
    ],
};