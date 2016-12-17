Vue  = require "vue"
VueRouter = require "vue-router"

Vue.use VueRouter

hello = require "../components/hello.vue"
login = require "../components/login.vue"
notFound = require "../components/404.vue"

routes = [
    {
        name: "foo"
        path: "/foo"
        components: {
            a: hello
        }
        meta: {
            customInfo: "meta_foo"
        }
        children: [
            {
                path: "child"
                component: {
                    template: "<p>child</p>"
                }
                meta: {
                    customInfo: "meta_foo/child"
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
        name: "home"
        path: "/home"
        components: {
            a: {
                template: "<p>home</p>"
            }
        }
        meta: {
            customInfo: "meta_home"
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
    isAuth = to.matched.some (record)->
        if record.meta.customInfo is "meta_foo"
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

router.push "home"

module.exports = router