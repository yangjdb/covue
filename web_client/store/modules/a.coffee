TYPES = require "../mutation-types.coffee"

#actions
userAction = require "../actions/user.coffee"


mutations = {}
mutations[TYPES.USER.LOGIN] = (state)->
    state.username = "admin"
mutations[TYPES.OTHER.COUNT] = (state)->
    state.count++
mutations[TYPES.OTHER.STATUS] = (state)->
    state.status = "check"



module.exports =
    state:
        count: 0
        status: "success"
    mutations: mutations
    getters:
        todo: (state, getters)->
            return state.status
    actions:
        increment: ({state, rootState, commit, dispatch, getters})->
            commit TYPES.OTHER.COUNT
            
        helloIncrement: ({state, rootState, commit, dispatch, getters})->
            commit TYPES.OTHER.STATUS

        userLogin: (context, cb)->
#            #回调方式改为watch，分离视图模型
#            context.commit TYPES.USER.LOGIN
#            cb.success()
            userAction.login null, (err, result)->
                if result.status is "success"
                    context.rootState.username = localStorage.username = "admin"