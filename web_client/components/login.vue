<template lang="jade">
div
    p 请先登录
    button(v-on:click="login") Login
</template>

<script lang="coffee">
module.exports =

    methods:
        login: (event)->
            #登录模块
            @$store.dispatch {
                type: "userLogin"
                success: =>
                    #此处应该用回调
                    @$router.push {
                        path: "/foo/child"
                    }
                error: =>
            }






</script>