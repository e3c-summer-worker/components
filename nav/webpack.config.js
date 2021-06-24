const path = require('path')


module.exports = {
    devtool: 'inline-source-map',
    entry: './src/app.tsx',
    // i think output/ stuff is just for build?
    output: {
        path: path.join(__dirname, 'public'),
        filename: 'app.js'
    },
    resolve: {
        extensions: ['.ts', '.tsx', '.js']
    },
    module: {
        rules: [
            { test: /\.tsx?$/, loader: 'ts-loader' }
        ]
    },
    devServer: {
        // location of the static html
        contentBase: path.join(__dirname, 'public'),
        // Make webpack-dev-server live-reload when your
        // shell page changes
        watchContentBase: true,
        // This is where webpack-dev-server serves your bundle.js
        // which is created in memory (you will not see an app.js)
        publicPath: '/dist'
    }
}