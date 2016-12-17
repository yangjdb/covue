Vue  = require "vue"
Vuex = require "vuex"

Vue.use Vuex

#modules
module_a = require "./modules/a.coffee"

store = new Vuex.Store({
    modules:
        a: module_a
})

if module.hot
    acceptModules = ['./modules/a.coffee']
    module.hot.accept acceptModules, =>
        store.hotupdate {
            modules:
                a: require "./modules/a.coffee"
        }


module.exports = store