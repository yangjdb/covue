<template lang="jade">
div
    p 请先登录
    button(v-on:click="login") Login
</template>

<script lang="coffee">
{mapActions} = require "vuex"
module.exports =

    methods: mapActions({
        login: (state)->
            #登录模块
            state.a.username = "admin"

    })




</script>