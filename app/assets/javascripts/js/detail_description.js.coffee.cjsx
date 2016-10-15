toCurrencyRp = (num) ->
  return 'Rp. 0.0' if num == null || num == undefined
  num = Number(Math.round(num + 'e2') + 'e-2')
  "#{num.toLocaleString('en-US')}"

DetailDescription = React.createClass
  PropTypes: {
    defaultDetailImage: React.PropTypes.object
  }

  getInitialState: ->
    {
      deviceDetailContent: AdxWrapperStore.deviceDetailContent
    }

  componentDidMount: ->
    @listener = AdxWrapperStore.addChangeListener(@_onChange)

  componentWillUnmount: ->
    @listener.remove()

  _onChange: ->
    @setState(deviceDetailContent: AdxWrapperStore.deviceDetailContent)

  render: ->
    { deviceDetailContent } = @state
    { location, description, size, height, width, get_rotation_display, price, property_type, address,
      country, province, city, zipcode, audience_daily, average_spending,
      audience_description, frequently_per_hour, imageLists} = deviceDetailContent

    if _.isEmpty(deviceDetailContent)
      <div className="row"></div>
    else
      _this = @
      imageRowComponents = (e) ->
        <div className="col-sm-6" key={e.id}><img src={if e?.thumbnail_100 then e?.thumbnail_100 else _this.props.defaultDetailImage.item} className="image-responsive"/></div>
      <div className="row">
        <div className="col-sm-12">
          <div className="page-wrap">
            <h3 className="page-sub">Screen Detail</h3>
            <h1 className="page-title">{location}</h1>
          </div>
          <div className="page-content">
            <div className="row">
              <div className="col-sm-6">
                <div className="gallery-adx">
                  <div className="row">
                    {imageLists.map(imageRowComponents)}
                  </div>
                </div>
              </div>
              <div className="col-sm-6">
                <div className="page-wrap">
                  <h3 className="page-sub">Description</h3>
                  <span className="meta-feature">
                    <span>
                      <img src={@props.defaultDetailImage.employees}/>
                      {audience_daily} people/day
                    </span>
                  </span>
                  <span className="meta-feature">
                    <span>
                      <img src={@props.defaultDetailImage.tv}/>
                      {get_rotation_display}
                    </span>
                  </span>
                </div>
                <div className="meta-detail">
                  <div className="meta-table">
                    <div className="meta-title">
                      <span>Location</span>
                    </div>
                    <div className="meta-value">
                      :&nbsp;
                      <span>{location}</span>
                    </div>
                  </div>
                  <div className="meta-table">
                    <div className="meta-title">
                      <span>Property Type</span>
                    </div>
                    <div className="meta-value">
                      :&nbsp;
                      <span>{property_type}</span>
                    </div>
                  </div>
                  <div className="meta-table">
                    <div className="meta-title">
                      <span>Avg. Spending</span>
                    </div>
                    <div className="meta-value">
                      :&nbsp;
                      <span>Rp. {toCurrencyRp(Number(average_spending))}/person</span>
                    </div>
                  </div>
                  <div className="meta-table">
                    <div className="meta-title">
                      <span>Price</span>
                    </div>
                    <div className="meta-value">
                      :&nbsp;
                      <span>Rp. {toCurrencyRp(Number(price))}</span>
                    </div>
                  </div>
                </div>
                <div className="meta-description">
                  <p>{description}</p>
                  <p>{audience_description}</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

window.DetailDescription = DetailDescription
