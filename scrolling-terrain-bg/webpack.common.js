//webpack.config.js
const path = require('path');

module.exports = {
    entry: {
        main: "./src/sketch.ts",
    },
    // https://stackoverflow.com/q/57022906
    output: {
        library: 'TerrainSketch',
        libraryTarget: 'umd',
        path: path.resolve(__dirname, './build'),
        filename: "scrolling-terrain.js", // <--- Will be compiled to this single file
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
            },
            {
                test: /\.(png|jpe?g)/,
                type: 'asset/resource'
            }

        ]
    },
};