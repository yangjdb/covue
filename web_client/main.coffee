Vue    = require "vue"
store  = require "./store"
router = require "./router"
app    = require "./components/app.vue"

vue = new Vue({
    el: "#app"
    store: store
    template: '
        <app :my-message="1+1" />
    '
    components: {
        app
    }

    router: router
})
