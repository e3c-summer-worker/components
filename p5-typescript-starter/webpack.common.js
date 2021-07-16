//webpack.config.js
const path = require('path');

module.exports = {
    entry: {
        main: "./src/sketch.ts",
    },
    // https://stackoverflow.com/q/57022906
    output: {
        library: 'PolygonSketch',
        libraryTarget: 'umd',
        path: path.resolve(__dirname, './build'),
        filename: "[name]-bundle.js", // <--- Will be compiled to this single file
        clean: true,
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