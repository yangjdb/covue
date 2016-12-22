<template lang="jade">
div
    img(src="../src/assets/img/logo.png")
    p 测试子组件data：{{msg}}
    p 测试父组件props：{{myMessage}}
    p 测试父组件state：{{count}}
    p
        button(v-on:click="increment") +

    router-link(to="/foo") 子页面1
    &nbsp;
    router-link(to="/foo/child") 子页面1-1
    &nbsp;
    router-link(to="/component") 子页面2
    &nbsp;
    <!--router-link(to="/swip") 翻页-->

    p ----------------1-----------------
    transition
        router-view(name="a")

    p ----------------2-----------------
    router-view(name="b")

    p ----------------3-----------------
    router-view(name="c")



</template>
<script lang="coffee">
module.exports =
    name: "app"
    data: ->
        return {
            msg: @$store.getters.todo
        }
    props: ['myMessage']

#    components: {
#        hello
#    }

    created: ->
        if localStorage.username?
            @$store.state.username = localStorage.username

    computed:
        count: ->
            return @$store.state.a.count

    methods:
        increment: ->
            @$store.dispatch('increment')

    watch: {

        "count": ->
            console.log "count"

        "$route": (to, from)->
            toDepth = to.path.split('/').length
            fromDepth = from.path.split('/').length
            this.transitionName = toDepth < fromDepth ? 'slide-right' : 'slide-left'
    }

</script>

<style>


</style>