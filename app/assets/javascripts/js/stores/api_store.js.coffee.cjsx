{EventEmitter} = fbemitter

CHANGE_EVENT = 'change'

window.ApiStore = _.assign(new EventEmitter(), {
  api: {}
  currentUser: {}

  getApiUrl: (name) ->
    _.find(@api?.item, (e) -> e.name == name)

  emitChange: -> @emit(CHANGE_EVENT)
  addChangeListener: (callback) -> @addListener(CHANGE_EVENT, callback)

  emitItemChange: -> @emit(ITEM_CHANGE_EVENT)
  addItemChangeListener: (callback) -> @addListener(ITEM_CHANGE_EVENT, callback)
})

dispatcher.register (payload) ->
  switch payload.actionType
    when 'intialize-set-api'
      ApiStore.api = payload.api
      ApiStore.emitChange()
    when 'api-set-user'
      ApiStore.currentUser = payload.user
      ApiStore.emitChange()
