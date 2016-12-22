Vue  = require "vue"
VueRouter = require "vue-router"

Vue.use VueRouter

#vue
hello    = require "../components/hello.vue"
login    = require "../components/login.vue"
notFound = require "../components/404.vue"

routes = [
    {
        name: "foo"
        path: "/foo"
        components: {
            a: hello
        }
        meta: {
            customInfo: "checkLoginStatus"
        }
        children: [
            {
                path: "child"
                component: {
                    template: "
                        <div>
                            <p>---------------1-1----------------</p>
                            <p>child</p>
                            <p>{{username}}</p>
                        </div>

                    "
                    computed:
                        username: ->
                            return @$store.state.username
                }
                meta: {
                    customInfo: "checkLoginStatus"
                }
            }
        ]
    }
    {
        name: "component"
        path: "/component"
        components: {
            b: {
                template: "<p>component</p>"
            }
        }
        meta: {
            customInfo: "meta_component"
        }
    }
    {
        name: "login"
        path: "/login"
        components: {
            c: login
        }
    }
    {
        path: "*"
        components: {
            default: notFound
        }
    }
]


router = new VueRouter({
    mode: "hash"
    routes: routes
})

router.beforeEach (to, from, next)=>
    if not localStorage.username?
        isAuth = to.matched.some (record)->
            if record.meta.customInfo is "checkLoginStatus"
                return true
            return false
        if isAuth
            next({
                path: "/login"
                query: {
                    redirect: to.fullPath
                }
            })
        else
            next()
    else
        next()

#router.push "home"

module.exports = router