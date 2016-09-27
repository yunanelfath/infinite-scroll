{EventEmitter} = fbemitter

CHANGE_EVENT = 'change'

window.FeaturedScreenStore = _.assign(new EventEmitter(), {
  items: []
  requesting: { type: null, status: false }

  emitChange: -> @emit(CHANGE_EVENT)
  addChangeListener: (callback) -> @addListener(CHANGE_EVENT, callback)
})

dispatcher.register (payload) ->
  switch payload.actionType
    when 'featured-screen-set-items'
      FeaturedScreenStore.items = payload.attributes.items
      FeaturedScreenStore.emitChange()
