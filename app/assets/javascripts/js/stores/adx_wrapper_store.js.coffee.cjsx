{EventEmitter} = fbemitter

CHANGE_EVENT = 'change'
ITEM_CHANGE_EVENT = 'change:item'

window.AdxWrapperStore = _.assign(new EventEmitter(), {
  deviceListsFeatured: []
  deviceLists: []
  deviceDetail: []
  deviceOperatingHour: []
  deviceImages: []
  unavailableDateDevices: []
  filterDevice: []

  requesting: { type: null, status: false }

  emitChange: -> @emit(CHANGE_EVENT)
  addChangeListener: (callback) -> @addListener(CHANGE_EVENT, callback)

  emitItemChange: -> @emit(ITEM_CHANGE_EVENT)
  addItemChangeListener: (callback) -> @addListener(ITEM_CHANGE_EVENT, callback)
})

dispatcher.register (payload) ->
  switch payload.actionType
    when 'featured-screen-set-items'
      items = AdxWrapperStore.deviceListsFeatured
      if items.length > 0
        for item in payload.items
          if $.inArray(item.pub_id, _.map(items, (e) -> e.pub_id)) < 0
            items.push(item)
      else
        AdxWrapperStore.deviceListsFeatured = payload.items
      AdxWrapperStore.emitChange()
