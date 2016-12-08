module.exports =

    app: "index.html"
    template: "./web_client/index.jade"

    dev:
        subDirectory: "static"
        port: 8808

    build:
        subDirectory: "dist"
        productionGzip: false
        productionGzipExtensions: ['js', 'css']