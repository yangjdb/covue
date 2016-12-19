TYPES = require "../mutation-types.coffee"

mutations = {}
mutations[TYPES.USER.LOGIN] = (state)->
    state.username = "admin"
mutations[TYPES.STATUS] = (state)->
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
            commit TYPES.STATUS
            
        helloIncrement: ({state, rootState, commit, dispatch, getters})->
            commit TYPES.STATUS

        userLogin: (context, cb)->
            context.commit TYPES.USER.LOGIN
            cb.success()
            