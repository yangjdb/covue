semver = require('semver')
chalk = require('chalk')
packageConfig = require('../package.json')

exec = (cmd) ->
    require('child_process').execSync(cmd).toString().trim()

versionRequirements = [
    {
        name              : 'node'
        currentVersion    : semver.clean(process.version)
        versionRequirement: packageConfig.engines.node
    }
    {
        name              : 'npm'
        currentVersion    : exec('npm --version')
        versionRequirement: packageConfig.engines.npm
    }
]

module.exports = ->
    `var i`
    warnings = []
    i = 0
    while i < versionRequirements.length
        mod = versionRequirements[i]
        if !semver.satisfies(mod.currentVersion, mod.versionRequirement)
            warnings.push mod.name + ': ' + chalk.red(mod.currentVersion) + ' should be ' + chalk.green(mod.versionRequirement)
        i++
    if warnings.length
        console.log ''
        console.log chalk.yellow('To use this template, you must update following to modules:')
        console.log()
        i = 0
        while i < warnings.length
            warning = warnings[i]
            console.log '  ' + warning
            i++
        console.log()
        process.exit 1
    return