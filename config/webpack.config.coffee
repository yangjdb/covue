path                = require "path"
utils               = require "../build/utils.coffee"
webpack             = require "webpack"
HtmlWebpackPlugin   = require "html-webpack-plugin"
projectRoot         = path.resolve(__dirname, '../')

#require('coffee-loader')
#require('coffee-loader!./file.coffee')
#require('coffee-loader?literate!./file.litcoffee')

module.exports =

    entry:
        main: ['./build/dev-client.coffee', './web_client/main.coffee']

    output:
        path: path.resolve(__dirname, '..', 'dist')
        publicPath: '/'
        filename: '[name].js'

    resolve:
        extensions: ['', '.vue', '.js', '.coffee']
        fallback: [path.join(__dirname, '../node_modules')]
        alias:
            'vue$': 'vue/dist/vue.js'
#            'web_client': path.resolve(__dirname, '../web_client')

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
                test: /\.vue$/
                loader: 'vue'
            }
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
            {
                test: /\.(png|jpe?g|gif|svg)(\?.*)?$/
                loader: 'url'
                query:
                    limit: 10000
                    name: utils.assetsPath('img/[name].[hash:7].[ext]')
            }
            {
                test: /\.(woff2?|eot|ttf|otf)(\?.*)?$/
                loader: 'url'
                query:
                    limit: 10000
                    name: utils.assetsPath('fonts/[name].[hash:7].[ext]')
            }
        ]

    vue:
        loaders:
            js: "coffee"
            html: "pug"
            css: "less"


    plugins: [
        #https://github.com/glenjamin/webpack-hot-middleware#installation--usage
        new webpack.optimize.OccurenceOrderPlugin()
        new webpack.HotModuleReplacementPlugin()
        new webpack.NoErrorsPlugin()
        #https://github.com/ampedandwired/html-webpack-plugin
        new HtmlWebpackPlugin({
            title: "covue"
            filename: 'index.html'
            template: './web_client/index.jade'
            inject: 'body'
#            favicon: "app/favicon.ico"
#            cache: false
            minify: {
                removeComments: true
                collapseWhitspace: true
            }
        })
    ]