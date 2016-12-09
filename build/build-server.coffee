require("./check-version.coffee")()
require "shelljs/global"

env.NODE_ENV  = "production"

path          = require "path"
config        = require "../config/index.coffee"
ora           = require "ora"
webpack       = require "webpack"
webpackConfig = require "../config/webpack.build.config.coffee"

spinner = ora "start building for production..."
spinner.start()

assetsPath = path.resolve(__dirname, '..', config.build.subDirectory)
rm '-rf', assetsPath
mkdir '-p', assetsPath
#cp '-R', './static/*', assetsPath
webpack webpackConfig, (err, stats) ->
    spinner.stop()
    if err
        throw err
    process.stdout.write stats.toString(
        colors      : true
        modules     : false
        children    : false
        chunks      : false
        chunkModules: false) + '\n'
    return