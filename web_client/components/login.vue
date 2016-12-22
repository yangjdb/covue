<template lang="jade">
div
    p 请先登录
    button(v-on:click="login") Login
</template>

<script lang="coffee">
module.exports =

    computed:
        username: ->
            return @$store.state.username

    methods:
        login: (event)->
            #登录模块
            @$store.dispatch {
                type: "userLogin"
#                #回调方式改为watch，分离视图模型
#                success: =>
#                    #此处应该用回调
#                    @$router.push {
#                        path: "/foo/child"
#                    }
#                error: =>
            }


    watch:
        "username": (username)->
            if username?
                @$router.push {
                    path: "/foo/child"
                }








</script>