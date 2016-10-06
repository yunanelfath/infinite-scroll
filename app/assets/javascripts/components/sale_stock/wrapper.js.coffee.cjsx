WrapperSaleStock = React.createClass
  getInitialState: ->
    {
      contentType: SaleStockStore.contentType
    }

  componentDidMount: ->
    @listener = SaleStockStore.addChangeListener(@_onChange)

  _onChange: ->
    @setState(contentType: SaleStockStore.contentType)

  componentWillUnMount: ->
    @listener.remove()

  _onAttributesChanged: (attributes) ->
    dispatcher.dispatch(
      actionType: 'sale-stock-global-attributes-setter'
      attributes: attributes
    )

  onClickForm: (type)->
    @_onAttributesChanged(contentType: type)

  render: ->
    { contentType } = @state

    <div>
      <HeaderSaleStock onShowForm={@onClickForm}/>
      {
        if contentType == 'application'
          <ApplicationSaleStock />
        else
          <ContentSaleStock onShowForm={@onClickForm}/>
      }
    </div>
window.WrapperSaleStock = WrapperSaleStock
