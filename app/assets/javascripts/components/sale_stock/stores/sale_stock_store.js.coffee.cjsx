{EventEmitter} = fbemitter

CHANGE_EVENT = 'change'
ITEM_CHANGE_EVENT = 'change:item'

window.SaleStockStore = _.assign(new EventEmitter(), {
  contentType: 'home'
  form: {}
  requesting: { type: null, status: false }

  emitChange: -> @emit(CHANGE_EVENT)
  addChangeListener: (callback) -> @addListener(CHANGE_EVENT, callback)

  emitItemChange: -> @emit(ITEM_CHANGE_EVENT)
  addItemChangeListener: (callback) -> @addListener(ITEM_CHANGE_EVENT, callback)
})

dispatcher.register (payload) ->
  switch payload.actionType
    when 'sale-stock-global-attributes-setter'
      _.assign(SaleStockStore, payload.attributes)
      SaleStockStore.emitChange()
