<template lang="jade">
div
    h1 {{msg}}
    p 测试父组件state：{{helloCount}}
    button(v-on:click="increment") change
    router-view
</template>

<script lang="coffee">
{mapState} = require "vuex"
module.exports =
    data: ->
        return {
            msg: "hello"
        }
    computed: mapState({
        helloCount: (state)->
            return state.a.status
    })

    methods:
        increment: ->
            @$store.dispatch('helloIncrement')

    beforeRouteEnter: (to, from, next)->
        next (vm)=>

    beforeRouteLeave: (to, from, next)->
        next()


</script>