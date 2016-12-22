Vue  = require "vue"
Vuex = require "vuex"
VueResource = require "vue-resource"

Vue.use VueResource
Vue.use Vuex

#modules
module_a = require "./modules/a.coffee"

store = new Vuex.Store({
    state:
        username: null
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