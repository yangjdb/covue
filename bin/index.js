#!/usr/bin/env node
var program = require('commander')
    .version(require('../package').version)
    .usage('<command> [options]')
    .parse(process.argv);

program.on('--help', function () {
    console.log('  Examples:');
    console.log();
    console.log('  $ covue my-project');
    console.log();
})

if (program.args.length < 1) return program.help();


var path = require("path");
require("shelljs/global");

var template = program.args[0];

var directs = ["build", "config", "web_client", "web_server", "package.json"];
var assetsPath = path.resolve(process.cwd(), template);
rm('-rf', assetsPath);
mkdir('-p', assetsPath);
for(var dir of directs){
    var sourcePath = path.resolve(__dirname, '..', dir);
    cp('-rf', sourcePath, assetsPath);
}
