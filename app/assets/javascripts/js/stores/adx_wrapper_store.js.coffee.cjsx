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
  propertyTypeLists: []
  cityLists: []
  sizeLists: []
  rotationLists: []
  urlFilter: {}
  deviceDetailId: ''
  deviceDetailContent: {}

  requesting: { type: null, status: false }

  getFilterByKey: (array, key) ->
    _.find(array, (e) -> e.key == key)

  emitChange: -> @emit(CHANGE_EVENT)
  addChangeListener: (callback) -> @addListener(CHANGE_EVENT, callback)

  emitItemChange: -> @emit(ITEM_CHANGE_EVENT)
  addItemChangeListener: (callback) -> @addListener(ITEM_CHANGE_EVENT, callback)
})

dispatcher.register (payload) ->
  switch payload.actionType
    when 'featured-screen-set-items'
      items = AdxWrapperStore.deviceListsFeatured
      if payload?.onReset
        AdxWrapperStore.deviceListsFeatured = payload.items
      else
        if items.length > 0
          for item in payload.items
            if $.inArray(item.pub_id, _.map(items, (e) -> e.pub_id)) < 0
              items.push(item)
        else
          AdxWrapperStore.deviceListsFeatured = payload.items

      AdxWrapperStore.emitChange()
    when 'screen-filter-device-set-type'
      if payload.type == 'sizeLists'
        items = _.map(payload.items, (e) -> {name: "#{e} Inch", key: e})
      else if payload.type == 'cityLists'
        items = _.map(payload.items, (e) -> {name: e.name, key: e.id, id: e.id})
      else
        items = _.map(payload.items, (e, i) -> {name: i, key: e})
      AdxWrapperStore[payload.type] = items
      AdxWrapperStore.emitChange()
    when 'screen-filter-device-set-checked-filter'
      item = _.find(AdxWrapperStore[payload.type], (e) -> e[payload.sourceKey] == payload.key)
      _.assign(item, payload.attributes)
      AdxWrapperStore.emitItemChange(item)
      AdxWrapperStore.emitChange()
    when 'adx-global-attributes-setter'
      _.assign(AdxWrapperStore, payload.attributes)
      AdxWrapperStore.emitChange()
