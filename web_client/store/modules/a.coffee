types = require "../mutation-types.coffee"

mutations = {}
mutations[types.USER] = (state)->
    state.count++
mutations[types.STATUS] = (state)->
    state.status = "check"


module.exports =
    state:
        count: 0
        status: "success"
        username: null
    mutations: mutations
    getters:
        todo: (state, getters)->
            return state.status
    actions:
        increment: ({state, rootState, commit, dispatch, getters})->
            commit types.USER
            
        helloIncrement: ({state, rootState, commit, dispatch, getters})->
            commit types.STATUS
            