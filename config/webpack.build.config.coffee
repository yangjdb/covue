utils               = require "../build/utils.coffee"
config              = require "./index.coffee"
path                = require "path"
webpack             = require "webpack"
merge               = require "webpack-merge"
htmlWebpackPlugin   = require "html-webpack-plugin"
extractTextPlugin   = require "extract-text-webpack-plugin"
baseWebpackConfig   = require "./webpack.base.config.coffee"



webpackConfig = merge baseWebpackConfig, {

    entry:
        main: './web_client/main.coffee'

    module :
        loaders: utils.styleLoaders({
            sourceMap: true
            extract  : true
        })
    devtool: '#source-map'
    output :
        path         : path.resolve(__dirname, "..", config.build.subDirectory)
        publicPath   : './'
        filename     : utils.assetsPath('js/[name].[chunkhash].js')
        chunkFilename: utils.assetsPath('js/[id].[chunkhash].js')
    vue :
        loaders: utils.cssLoaders({
            sourceMap: true
            extract  : true
        })
    plugins: [
        new webpack.optimize.UglifyJsPlugin({
            compress:
                warnings: false
        })

        new webpack.optimize.OccurrenceOrderPlugin()
        new extractTextPlugin(utils.assetsPath('css/[name].[contenthash].css'))
        new htmlWebpackPlugin({
            filename      : path.resolve(__dirname, "..", config.build.subDirectory, config.app)
            template      : config.template
            inject        : 'body'
            minify        : {
                removeComments       : true
                collapseWhitspace    : true
                removeAttributeQuotes: true
            }
            chunksSortMode: 'dependency'
        })

        new webpack.optimize.CommonsChunkPlugin({
            name     : 'vendor'
            minChunks: (module, count)->
                return (
                    module.resource &&
                        /\.js$/.test(module.resource) &&
                        module.resource.indexOf(path.join(__dirname, '../node_modules')) is 0
                )
        })

        new webpack.optimize.CommonsChunkPlugin({
            name  : 'mainfest'
            chunks: ['vendor']
        })
    ]
}

if config.build.productionGzip
    compressionWebpackPlugin = require('compression-webpack-plugin')
    webpackConfig.plugins.push new compressionWebpackPlugin(
        asset    : '[path].gz[query]'
        algorithm: 'gzip'
        test     : new RegExp('\\.(' + config.build.productionGzipExtensions.join('|') + ')$')
        threshold: 10240
        minRatio : 0.8)

module.exports = webpackConfig