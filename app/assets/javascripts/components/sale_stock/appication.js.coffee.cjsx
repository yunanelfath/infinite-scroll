{ Button, FormGroup, FormControl, Col, Row } = ReactBootstrap

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
    @_dispatchChange(name: event.target.value)

  onBuktiFotoOngkirChanged: (event) ->
    @_dispatchChange(buktiFotoOngkir: event.target.value)

  onEmailChanged: (event) ->
    @_dispatchChange(email: event.target.value)

  onHandphoneChanged: (event) ->
    @_dispatchChange(handphone: event.target.value)

  onOrderNumberChanged: (event) ->
    @_dispatchChange(orderNumber: event.target.value)

  onBiayarKirimBalikChanged: (event) ->
    @_dispatchChange(biayaKirimBalik: event.target.value)

  onKeteranganChanged: (event) ->
    @_dispatchChange(keterangan: event.target.value)

  onNextClick: ->
    { activeForm } = @state
    backForm = null
    if activeForm.current == 'data-sista'
      nextForm = 'submitting-form'
      current = 'data-order'
      backForm = 'data-sista'
    else if activeForm.current == 'data-order'
      nextForm = null
      current = 'submitting-form'
      backForm = 'data-order'
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




  render: ->
    { form, activeForm } = @state
    { name, email, handphone, orderNumber, biayaKirimBalik, keterangan, buktiFotoOngkir } = form

    <div className="container">
      {
        if activeForm.current == 'data-sista'
          <div className="jumbotron" style={paddingTop: '10px'}>
            <legend>Data Sista</legend>
            <div className="bs-example">
              <FormGroup>
                <label className="control-label">Nama Sista*</label>
                <FormControl value={name} placeholder="Nama sista" onChange={@onNameChanged}/>
              </FormGroup>
              <FormGroup>
                <label className="control-label">Email Sista*</label>
                <FormControl value={email} placeholder="Email sista" onChange={@onEmailChanged}/>
              </FormGroup>
              <FormGroup>
                <label className="control-label">Handphone Sista*</label>
                <FormControl value={handphone} placeholder="Handphone sista" onChange={@onHandphoneChanged}/>
              </FormGroup>
            </div>
          </div>
      }
      {
        if activeForm.current == 'data-order'
          <div className="jumbotron" style={paddingTop: '10px'}>
            <legend>Data Order</legend>
            <div className="bs-example">
              <FormGroup>
                <label className="control-label">Nomor Order</label>
                <FormControl value={orderNumber} placeholder="Nomor Order" onChange={@onOrderNumberChanged}/>
              </FormGroup>
              <FormGroup>
                <label className="control-label">Biaya Kirim Balik</label>
                <FormControl value={biayaKirimBalik} placeholder="Biaya Kirim Balik" onChange={@onBiayarKirimBalikChanged}/>
              </FormGroup>
              <FormGroup>
                <label className="control-label">Keterangan</label>
                <textarea value={keterangan} placeholder="Keterangan" className="form-control" onChange={@onKeteranganChanged}></textarea>
              </FormGroup>
              <FormGroup>
                <label className="control-label">Bukti Foto Ongkir</label>
                <FormControl value={buktiFotoOngkir} placeholder="Bukti Foto Ongkir" onChange={@onBuktiFotoOngkirChanged}/>
              </FormGroup>
            </div>
          </div>
      }

      <div className="navbar navbar-default navbar-fixed-bottom">
        <div className="container" style={paddingTop: '8px'}>
          {
            if $.inArray(activeForm.current, ["data-order","submitting-form"]) >= 0
              <Button className="btn btn-primary pull-left" onClick={@onBackClick}>« Back</Button>
          }
          {
            if activeForm.current == 'submitting-form'
              <Button className="btn btn-success pull-right">Submit</Button>
            else
              <Button className="btn btn-success pull-right" onClick={@onNextClick}>Next »</Button>
          }
        </div>
      </div>
    </div>
window.ApplicationSaleStock = ApplicationSaleStock
