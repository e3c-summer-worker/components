//webpack.config.js
const path = require('path');

module.exports = {
    mode: 'development',
    devtool: "inline-source-map",
    entry: {
        main: "./src/sketch.ts",
    },
    // https://stackoverflow.com/q/57022906
    output: {
        library: 'Sketch',
        libraryTarget: 'umd',
        libraryExport: 'default',
        path: path.resolve(__dirname, './build'),
        filename: "[name]-bundle.js" // <--- Will be compiled to this single file
    },
    resolve: {
        extensions: ['.ts', '.js'],
    },
    module: {
        rules: [
            {
                test: /\.tsx?$/,
                loader: "ts-loader"
            }
        ]
    },
};