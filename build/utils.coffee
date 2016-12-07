path = require('path')
config = require('../config/dev.config.coffee')
ExtractTextPlugin = require('extract-text-webpack-plugin')

exports.assetsPath = (_path) ->
#    assetsSubDirectory = if process.env.NODE_ENV == 'production' then config.build.assetsSubDirectory else config.dev.assetsSubDirectory
    assetsSubDirectory = config.publicPath
    path.posix.join assetsSubDirectory, _path

exports.cssLoaders = (options) ->
# generate loader string to be used with extract text plugin
    generateLoaders = (loaders) ->
        sourceLoader = loaders.map((loader) ->
            extraParamChar = undefined
            if /\?/.test(loader)
                loader = loader.replace(/\?/, '-loader?')
                extraParamChar = '&'
            else
                loader = loader + '-loader'
                extraParamChar = '?'
            loader + (if options.sourceMap then extraParamChar + 'sourceMap' else '')
        ).join('!')
        # Extract CSS when that option is specified
        # (which is the case during production build)
        if options.extract
            ExtractTextPlugin.extract 'vue-style-loader', sourceLoader
        else
            [
                'vue-style-loader'
                sourceLoader
            ].join '!'

    options = options or {}
    # http://vuejs.github.io/vue-loader/en/configurations/extract-css.html
    {
        css: generateLoaders(['css'])
        postcss: generateLoaders(['css'])
        less: generateLoaders([
            'css'
            'less'
        ])
        sass: generateLoaders([
            'css'
            'sass?indentedSyntax'
        ])
        scss: generateLoaders([
            'css'
            'sass'
        ])
        stylus: generateLoaders([
            'css'
            'stylus'
        ])
        styl: generateLoaders([
            'css'
            'stylus'
        ])
    }

# Generate loaders for standalone style files (outside of .vue)

exports.styleLoaders = (options) ->
    output = []
    loaders = exports.cssLoaders(options)
    for extension of loaders
        loader = loaders[extension]
        output.push
            test: new RegExp('\\.' + extension + '$')
            loader: loader
    output