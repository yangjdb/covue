<template lang="jade">
div
    h1 {{msg}}
    p 测试父组件state：{{helloCount}}
    p 用户名：{{username}}
    button(v-on:click="increment") change
    p(v-bind:id="msg") {{msg}}

    router-view
</template>

<script lang="coffee">
{mapState} = require "vuex"
module.exports =
    data: ->
        return {
            msg: "hello"
            id: ""
            time: Date.now()
        }

    computed: mapState({
        helloCount: (state)->
            return state.a.status
        username: (state)->
            return state.username
    })

    methods:
        increment: ->
            @.msg = "fdvemi"
            @$store.dispatch('helloIncrement')

    beforeRouteEnter: (to, from, next)->
        next (vm)=>

    beforeRouteLeave: (to, from, next)->
        next()


</script>