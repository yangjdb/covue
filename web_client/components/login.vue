<template lang="jade">
div
    p 请先登录
    button(v-on:click="login") Login
</template>

<script lang="coffee">
module.exports =

    methods: {
        login: (state)->
            #登录模块
            @$store.dispatch "userLogin"

    }




</script>