{ Button, FormGroup, FormControl, Col, Row } = ReactBootstrap

getOrders = ->
  [
    {id: 888, items: [{id: 32,alasan: '', name: 'Kiraniar Plain Casual Cardigan 1', sku: 'BMW-ANC', price: 85000, foto: {}},{id: 33,name: 'Kiraniar Plain Casual Cardigan 2', sku: 'BMW-ANC', price: 43000, foto: {}}]}
    {id: 777, items: [{id: 32,alasan: '', name: 'Kiraniar Plain Casual Cardigan 1', sku: 'BMW-ANC', price: 85000, foto: {}},{id: 33,name: 'Kiraniar Plain Casual Cardigan 2', sku: 'BMW-ANC', price: 43000, foto: {}}]}
    {id: 555, items: [{id: 32,alasan: '', name: 'Kiraniar Plain Casual Cardigan 1', sku: 'BMW-ANC', price: 85000, foto: {}},{id: 33,name: 'Kiraniar Plain Casual Cardigan 2', sku: 'BMW-ANC', price: 43000, foto: {}}]}
  ]

getAlasanRetur = ->
  [
    {id: 1, value: 'Bolong'},{id: 2, value: 'Jahitan Tidak Rapi'},{id: 3, value: 'Kebesaran'},{id: 4, value: 'Kekecilan'}
  ]

ApplicationSaleStock = React.createClass
  getInitialState: ->
    {
      form: SaleStockStore.form
      activeForm: SaleStockStore.activeForm
    }

  componentDidMount: ->
    @listener = SaleStockStore.addChangeListener(@_onChange)

  componentWillUnMount: ->
    @listener.remove()

  _onChange: ->
    @setState(form: SaleStockStore.form, activeForm: SaleStockStore.activeForm)

  _dispatchChange: (attributes) ->
    dispatcher.dispatch(
      actionType: 'sale-stock-form-attributes-setter'
      attributes: attributes
    )

  _dispatchChangeActiveForm: (attributes) ->
    dispatcher.dispatch(
      actionType: 'sale-stock-activeForm-attributes-setter'
      attributes: attributes
    )

  onNameChanged: (event) ->
    @_dispatchChange(name: value: event.target.value, isRequired: false)

  onBuktiFotoOngkirChanged: (event) ->
    @_dispatchChange(buktiFotoOngkir: event.target.value)

  onEmailChanged: (event) ->
    @_dispatchChange(email: value: event.target.value, isRequired: false)

  onHandphoneChanged: (event) ->
    @_dispatchChange(handphone: value: event.target.value, isRequired: false)

  onOrderNumberChanged: (event) ->
    @_dispatchChange(orderNumber: value: event.target.value, isRequired: false)

  onBiayarKirimBalikChanged: (event) ->
    @_dispatchChange(biayaKirimBalik: value: event.target.value, isRequired: false)

  onKeteranganChanged: (event) ->
    @_dispatchChange(keterangan: value: event.target.value, isRequired: false)

  onValidateForm: ->
    { activeForm, form } = @state
    if activeForm.current == 'data-sista'
      requiredField = [{id: 'name',message: "Name can't be blank"}, {id: 'email',message: "Email can't be blank"}]
    else if activeForm.current == 'data-order'
      requiredField = [{id: 'orderNumber',message: "Order Number can't be blank"}]
    arrBlock = []
    for r in requiredField
      if form[r.id] == undefined || form[r.id]?.value == null || form[r.id]?.value == ''
        arrBlock.push(r.message)
        form[r.id] = {value: null, isRequired: true}
        @_dispatchChange(form)

    return arrBlock

  onNextClick: ->
    { activeForm } = @state
    arrValidate = @onValidateForm()
    if arrValidate.length > 0
      alert(arrValidate.join(", "))
      return false
    else
      backForm = null
      if activeForm.current == 'data-sista'
        nextForm = 'data-order'
        current = 'data-order'
        backForm = 'data-sista'
      else if activeForm.current == 'data-order'
        nextForm = null
        current = 'data-order'
        backForm = 'data-sista'
      @_dispatchChangeActiveForm(current: current, next: nextForm,back: backForm)

  onBackClick: ->
    { activeForm } = @state
    backForm = null
    if activeForm.current == 'data-order'
      nextForm = 'submitting-form'
      current = 'data-sista'
      backForm = 'data-sista'
    else if activeForm.current == 'submitting-form'
      nextForm = null
      current = 'data-order'
      backForm = 'data-order'
    @_dispatchChangeActiveForm(current: current, next: nextForm,back: backForm)

  onResetOrder: ->
    @_dispatchChange(orderNumber: value: null, isRequired: true, items: [])

  onFindOrder: ->
    { form } = @state
    _this = @
    items = _.find(getOrders(), (e) -> e.id == Number(form.orderNumber.value))
    setTimeout(=>
      if items
        _this._dispatchChange(orderNumber: value: form.orderNumber.value, isRequired: false, items: items.items)
      else
        alert('No data found!')
        _this._dispatchChange(orderNumber: value: null, isRequired: true, items: [])
    ,1000)

  onSubmitForm: ->
    { activeForm } = @state
    arrValidate = @onValidateForm()
    if arrValidate.length > 0
      alert(arrValidate.join(", "))
      return false
    else
      alert('your request has been sent')
      dispatcher.dispatch(
        actionType: 'sale-stock-global-attributes-setter'
        attributes: contentType: 'home', form: {}
      )
      @_dispatchChangeActiveForm(current: 'data-sista', next: 'data-order',back: null)

  render: ->
    { form, activeForm } = @state
    { name, email, handphone, orderNumber, biayaKirimBalik, keterangan, buktiFotoOngkir } = form

    tableItemOrderRow = (data) ->
      setOptionRow = (data) ->
        <option key={data.id} value="#{data.value}">{data.value}</option>
      <table className="table" style={borderLeft: "1px solid #dddddd",borderRight: "1px solid #dddddd"}>
        <tbody>
          <tr>
            <td colSpan={3}>
              <div style={fontWeight: 'bold', fontSize: '12px'}>{data.name}</div>
              <div style={color: '#808080', fontSize: '0.8em',fontStyle: 'italic'}>Nama Item</div>
            </td>
          </tr>
          <tr>
            <td>
              <select value={data.alasan} onChange={@onBlurSelect} className="form-control" placeholder="select" style={paddingLeft: '3px'}>
                {getAlasanRetur().map(setOptionRow)}
              </select>
              <div style={color: '#808080',fontStyle: 'italic',fontSize: '0.8em'}>Alasan Retur</div>
            </td>
            <td>
              {data.sku}
              <div style={color: '#808080',fontStyle: 'italic',fontSize: '0.8em'}>SKU</div>
            </td>
            <td>
              {data.price}
              <div style={color: '#808080',fontStyle: 'italic',fontSize: '0.8em'}>Harga Satuan</div>
            </td>
          </tr>
          <tr>
            <td colSpan={3}>
              <input type="file" value={data.foto?.value} onChange={@onChangeFile} className="form-control" style={padding: '0'}/>
              <div style={color: '#808080', fontSize: '0.8em',fontStyle: 'italic'}>Bukti Foto</div>
            </td>
          </tr>
        </tbody>
      </table>

    <div className="container">
      {
        if activeForm.current == 'data-sista'
          <div className="jumbotron" style={paddingTop: '10px'}>
            <legend>Data Sista</legend>
            <div className="bs-example">
              <FormGroup className="#{if name?.isRequired then 'has-error' else ''}">
                <label className="control-label">Nama Sista*</label>
                <FormControl value={name?.value} placeholder="Nama sista" onChange={@onNameChanged}/>
              </FormGroup>
              <FormGroup className="#{if email?.isRequired then 'has-error' else ''}">
                <label className="control-label">Email Sista*</label>
                <FormControl value={email?.value} placeholder="Email sista" onChange={@onEmailChanged}/>
              </FormGroup>
              <FormGroup className="#{if handphone?.isRequired then 'has-error' else ''}">
                <label className="control-label">Handphone Sista</label>
                <FormControl value={handphone?.value} placeholder="Handphone sista" onChange={@onHandphoneChanged}/>
              </FormGroup>
            </div>
          </div>
      }
      {
        if activeForm.current == 'data-order'
          <div className="jumbotron" style={paddingTop: '10px'}>
            <legend>Data Order</legend>
            <div className="bs-example">
              <FormGroup className="#{if orderNumber?.isRequired then 'has-error' else ''}">
                <label className="control-label">Nomor Order</label>
                <FormControl id="order_number" value={orderNumber?.value} placeholder="Nomor Order" onChange={@onOrderNumberChanged}/>
                <Button className="btn btn-primary" style={marginTop: '4px'} onClick={@onFindOrder}>Load</Button>
                <Button className="btn btn-danger" style={marginTop: '4px', marginLeft: '5px'} onClick={@onResetOrder}>Reset</Button>
              </FormGroup>
              {
                if orderNumber?.items && orderNumber?.items.length > 0
                  <FormGroup>{orderNumber?.items.map(tableItemOrderRow)}</FormGroup>
              }
              <FormGroup className="#{if biayaKirimBalik?.isRequired then 'has-error' else ''}">
                <label className="control-label">Biaya Kirim Balik</label>
                <FormControl value={biayaKirimBalik?.value} placeholder="Biaya Kirim Balik" onChange={@onBiayarKirimBalikChanged}/>
              </FormGroup>
              <FormGroup className="#{if keterangan?.isRequired then 'has-error' else ''}">
                <label className="control-label">Keterangan</label>
                <textarea value={keterangan?.value} placeholder="Keterangan" className="form-control" onChange={@onKeteranganChanged}></textarea>
              </FormGroup>
              <FormGroup className="#{if buktiFotoOngkir?.isRequired then 'has-error' else ''}">
                <label className="control-label">Bukti Foto Ongkir</label>
                <input type="file" value={buktiFotoOngkir?.value} className="form-control" style={padding: '0'} onChange={@onBuktiFotoOngkirChanged}/>
              </FormGroup>
            </div>
          </div>
      }

      <div className="navbar navbar-default navbar-fixed-bottom">
        <div className="container" style={paddingTop: '8px'}>
          {
            if $.inArray(activeForm.current, ["data-order"]) >= 0
              <Button className="btn btn-primary pull-left" onClick={@onBackClick}>« Back</Button>
          }
          {
            if activeForm.current == 'data-order'
              <Button className="btn btn-success pull-right" onClick={@onSubmitForm}>Submit</Button>
            else
              <Button className="btn btn-success pull-right" onClick={@onNextClick}>Next »</Button>
          }
        </div>
      </div>
    </div>
window.ApplicationSaleStock = ApplicationSaleStock
