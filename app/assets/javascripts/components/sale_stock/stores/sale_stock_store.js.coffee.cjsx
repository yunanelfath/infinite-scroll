{EventEmitter} = fbemitter

CHANGE_EVENT = 'change'
ITEM_CHANGE_EVENT = 'change:item'

window.SaleStockStore = _.assign(new EventEmitter(), {
  contentType: 'home'
  form: {}
  activeForm: {current: 'data-sista',next: 'data-order',back: null}
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
    when 'sale-stock-form-attributes-setter'
      form = SaleStockStore.form
      _.assign(form, payload.attributes)
      SaleStockStore.emitItemChange(form)
      SaleStockStore.emitChange()
    when 'sale-stock-activeForm-attributes-setter'
      form = SaleStockStore.activeForm
      _.assign(form, payload.attributes)
      SaleStockStore.emitItemChange(form)
      SaleStockStore.emitChange()
