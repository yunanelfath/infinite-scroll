filterState = ->
  {
    propertyTypeLists: AdxWrapperStore.propertyTypeLists
    cityLists: AdxWrapperStore.cityLists
    sizeLists: AdxWrapperStore.sizeLists
    rotationLists: AdxWrapperStore.rotationLists
  }

FilterScreen = React.createClass
  getInitialState: ->
    filterState()

  componentDidMount: ->
    @listener = AdxWrapperStore.addChangeListener(@_onChange)

  componentWillUnmount: ->
    @listener.remove()

  _onChange: ->
    @setState(filterState())

  onMouseEnter: (event) ->
    parent = $(event.target).closest('div')
    parent.addClass('hover')

  onMouseLeave: (event) ->
    parent = $(event.target).closest('div')
    parent.removeClass('hover')

  _onChangeCheckBox: (attr) ->
    dispatcher.dispatch(
      actionType: 'screen-filter-device-set-checked-filter'
      type: attr.type
      key: attr.key
      sourceKey: attr.source
      attributes: attr.attributes
    )

  onBoxChecked: (event) ->
    element = $(ReactDOM.findDOMNode(event.target))
    type = if element.attr('name') == 'TV Size' then "sizeLists" else if element.attr('name') == 'Monitor Rotation' then "rotationLists" else "propertyTypeLists"
    obj = JSON.parse(element.attr('data-props'))

    item = AdxWrapperStore.getFilterByKey(AdxWrapperStore[type], obj?.key)
    if item
      @_onChangeCheckBox(
        type: type
        attributes: checked: if item?.checked then !item?.checked else true
        key: item.key
        source: 'key'
      )

    setTimeout(=>
      @_setFilter()
    ,800)

  _setFilter: ->
    arrProperty = []
    arrRotation = []
    arrSize = []
    arrCity = []
    if @state.propertyTypeLists.length > 0
      for property in @state.propertyTypeLists
        if property?.checked
          arrProperty.push(property)

    if @state.cityLists.length > 0
      for city in @state.cityLists
        if city?.checked
          arrCity.push(city)

    if @state.rotationLists.length > 0
      for rotation in @state.rotationLists
        if rotation?.checked
          arrRotation.push(rotation)

    if @state.sizeLists.length > 0
      for size in @state.sizeLists
        if size?.checked
          arrSize.push(size)

    sizeLists = _.map(arrSize, (e) -> e.key)
    rotationLists = _.map(arrRotation, (e) -> e.key)
    cityLists = _.map(arrCity, (e) -> e.key)
    propertyLists = _.map(arrProperty, (e) -> e.key)
    params = {}
    if propertyLists.length > 0
      params.property_type = propertyLists.join(",")
    if sizeLists.length > 0
      params.size = sizeLists.join(",")
    if cityLists.length > 0
      params.city = cityLists.join(",")
    if rotationLists.length > 0
      params.rotation = rotationLists.join(",")
    params.max_price = 24000
    params.min_price = 0
    filterDevices(params)

  checkBoxContainer: (items, wordingType)->
    _this = @
    i = 1
    checkboxItemRow = (e)->
      <div key={Number(i++)}>
        <label>
          <div onMouseLeave={_this.onMouseLeave}
            onMouseEnter={_this.onMouseEnter}
            style={position: 'relative'}
            className="icheckbox_minimal-red
              #{if e?.checked then 'checked' else ''}"
            id="checkbox-minimal">
            <input type="checkbox"
              style={position: 'absolute',top: '-20%',left: '-20%',display: 'block',width: '140%',height: '140%',margin: '0px',padding: '0px',background: '#ffffff', border: '0px none',opacity: '0'}
              onChange={_this.onBoxChecked}
              name="#{wordingType}"
              data-props={JSON.stringify(e)}
              value={if e?.checked then e?.checked else false}/>
            <ins style={position: 'absolute',top: '-20%',left: '-20%',display: 'block',width: '140%',height: '140%',margin: '0',padding: '0',background: '#ffffff',border: '0px none',opacity: '0'}
              className="iCheck-helper"></ins>
          </div>
          <span>{e.name}</span>
        </label>
      </div>

    <div className="filter-section">
      <h3 className="filter-title">{wordingType}</h3>
      <div className="filter-form">
        {
          items.map(checkboxItemRow)
        }
      </div>
    </div>

  render: ->
    { propertyTypeLists, cityLists, sizeLists, rotationLists } = @state

    propertyFilter = @checkBoxContainer(propertyTypeLists, "Property Type")
    monitorFilter = @checkBoxContainer(rotationLists, "Monitor Rotation")
    tvSize = @checkBoxContainer(sizeLists, "TV Size")
    city = @checkBoxContainer(cityLists, "City")
    <div className="filter-screen">
      <h4>FILTER YOUR SELECTION</h4>
      <div className="filter-box">
        <div>
          {propertyFilter}
          {monitorFilter}
          {tvSize}
          {city}
        </div>
      </div>
    </div>


window.FilterScreen = FilterScreen
