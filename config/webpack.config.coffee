path                = require "path"
projectRoot         = path.resolve(__dirname, '../')
webpack             = require "webpack"
HtmlWebpackPlugin   = require "html-webpack-plugin"

#require('coffee-loader')
#require('coffee-loader!./file.coffee')
#require('coffee-loader?literate!./file.litcoffee')

module.exports =

    entry:
        app: ['./build/dev-client', './web_client/main.coffee']

    output:
        path: path.resolve(__dirname, '../dist')
        publicPath: '/'
        filename: '[name].js'

    resolve:
        extensions: ['', '.js', '.coffee', '.less','.jade']
        fallback: [path.join(__dirname, '../node_modules')]
        alias:
            'web_client': path.resolve(__dirname, '../web_client')

    resolveLoader:
        fallback: [path.join(__dirname, '../node_modules')]

    module:
        preLoader: [
            {
                test: /\.coffee$/
                loader: "coffee-loader"
                include: projectRoot
                exclude: /node_modules/
            }
            {
                test: /\.jade$/
                loader: 'pug'
            }
        ]
        loaders: [
            {
                test: /\.jade$/
                loader: 'pug'
            }
            {
                test: /\.js$/
                loader: 'babel'
                include: projectRoot
                exclude: /node_modules/
            }
            {
                test: /\.coffee$/
                loader: "coffee-loader"
                include: projectRoot
                exclude: /node_modules/
            }
            {
                test: /\.css$/
                loader: 'style!css'
                include: projectRoot
                exclude: /node_modules/
            }
            {
                test: /\.less$/
                loader: 'style!css!less'
                include: projectRoot
                exclude: /node_modules/
            }
        ]

    plugins: [
        #https://github.com/glenjamin/webpack-hot-middleware#installation--usage
        new webpack.optimize.OccurenceOrderPlugin()
        new webpack.HotModuleReplacementPlugin()
        new webpack.NoErrorsPlugin()
        #https://github.com/ampedandwired/html-webpack-plugin
        new HtmlWebpackPlugin({
            filename: 'index.html'
            template: './web_client/index.jade'
            inject: true
#            favicon: "app/favicon.ico"
            cache: false
            minify: {
              removeComments: true
              collapseWhitspace: true
            }
        })
    ]