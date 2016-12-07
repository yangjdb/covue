Vue = require "vue"
app = require "./app.vue"

#Vue.component 'hello', {
#    template: '<div>A custom component!</div>'
#}


vue = new Vue({
    el: "#app"
    template: "<app/>"
    components: {
        app
    }
})