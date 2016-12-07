config                  = require "../config/dev.config.coffee"
webpackConfig           = require "../config/webpack.config.coffee"
webpack                 = require "webpack"
express                 = require "express"
opn                     = require "opn"
path                    = require "path"
webpackDevMiddleware    = require "webpack-dev-middleware"
webpackHotMiddleware    = require "webpack-hot-middleware"

app = express()
compiler = webpack webpackConfig
devMiddleware = webpackDevMiddleware compiler, {
    publicPath: webpackConfig.output.publicPath
    stats:
        colors: true
        chunks: false
}
hotMiddleware = webpackHotMiddleware compiler
compiler.plugin 'compilation', (compilation, options)->
    compilation.plugin 'html-webpack-plugin-after-emit', (data, callback)->
        hotMiddleware.publish {action: "reload"}
        callback()

app.use devMiddleware
app.use hotMiddleware

app.use express.static(path.resolve(__dirname, "..", config.publicPath))
#app.use "/", (req, res, next)->
#    res.send "Welcome to coffee-vue"

port = config.port
module.exports = app.listen port, (err)->
    if err?
        return console.log err
    url = "http://localhost:#{port}"
    console.log "coffee webpack listening at #{port}"
#    opn url