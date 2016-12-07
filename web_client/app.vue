<template lang="jade">
div
    img(src="./src/assets/img/logo.png")
    hello
    {{msg}}
    header test
</template>
<script lang="coffee">
hello = require "./src/components/hello.vue"
module.exports = {
    name: "app"
    data: ->
        return {
            msg: "world"
        }
    components: {
        hello
    }
}


</script>

<style>


</style>