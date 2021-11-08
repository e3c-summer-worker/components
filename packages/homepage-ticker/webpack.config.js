

const path = require('path');


const elmEntryPath = path.join(__dirname, 'build/homepage-ticker-elm.js');
const outputPath = path.join(__dirname, 'build');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');


/**
 * We want multiple entries and outputs (one for the .js, one for the .css)
 * 
 * https://webpack.js.org/guides/entry-advanced/
 */
module.exports = {
    // this will only apply to .js files, since the scss will override the .js stuff I'm guessing
    // output: {
    //     path: __dirname + 'build',
    //     filename: 'ticker.js'
    // },
    module: {
        rules: [{
            test: /\.elm$/,
            exclude: [/elm-stuff/, /node_modules/],
            // Loading the custom elm-webpack-loader
            loader: './../elm-webpack-loader/index.js',
        }, {
            test: /\.scss$/,
            use: [
                // MiniCssExtractPlugin.loader,
                'css-loader',
                'sass-loader',
            ],
        }],
    },
    devServer: {
        contentBase: path.join(__dirname, 'build'),
        stats: 'errors-only'
    },
    plugins: [
        new MiniCssExtractPlugin({
            filename: '[name].css',
        }),
    ],
};