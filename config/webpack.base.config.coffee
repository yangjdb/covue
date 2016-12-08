utils               = require "../build/utils.coffee"
path                = require "path"
webpack             = require "webpack"
projectRoot         = path.resolve(__dirname, '../')

module.exports =

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