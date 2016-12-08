config              = require "./index.coffee"
path                = require "path"
webpack             = require "webpack"
merge               = require "webpack-merge"
htmlWebpackPlugin   = require "html-webpack-plugin"
baseWebpackConfig   = require "./webpack.base.config.coffee"

#require('coffee-loader')
#require('coffee-loader!./file.coffee')
#require('coffee-loader?literate!./file.litcoffee')

module.exports = merge baseWebpackConfig, {

    entry:
        main: ['./build/dev-client.coffee', './web_client/main.coffee']

    output:
        path: path.resolve(__dirname, '..', config.dev.subDirectory)
        publicPath: '/'
        filename: '[name].js'


#    vue:
#        loaders:
#            js: "coffee"
#            html: "pug"
#            css: "less"

    plugins: [
        #https://github.com/glenjamin/webpack-hot-middleware#installation--usage
        new webpack.optimize.OccurenceOrderPlugin()
        new webpack.HotModuleReplacementPlugin()
        new webpack.NoErrorsPlugin()
        #https://github.com/ampedandwired/html-webpack-plugin
        new htmlWebpackPlugin({
            title   : "covue"
            filename: config.app
            template: config.template
            inject  : 'body'
#            favicon: "app/favicon.ico"
#            cache: false
#            minify: {
#                removeComments: true
#                collapseWhitspace: true
#            }
        })
    ]
}