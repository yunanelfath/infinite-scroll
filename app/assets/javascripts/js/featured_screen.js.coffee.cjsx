featuredScreenState = ->
  {
    items: AdxWrapperStore.deviceListsFeatured
  }
FeaturedScreen = React.createClass
  propTypes: {
    featuredIcon: React.PropTypes.object
  }

  getInitialState: ->
    featuredScreenState()

  componentDidMount: ->
    @listener = AdxWrapperStore.addChangeListener(@_onChange)

  componentWillUnmount: ->
    @listener.remove()

  _onChange: ->
    @setState(featuredScreenState())

  render: ->
    { featuredIcon } = @props
    { items } = @state

    featureRowComponent = (i) ->
      <FeatureRowItem data={i} featuredIcon={featuredIcon} key={i.pub_id}/>


    <div>
      {items.map(featureRowComponent)}
    </div>

FeatureRowItem = React.createClass
  propTypes: {
    data: React.PropTypes.object
    featuredIcon: React.PropTypes.object
  }

  onSetDetail: ->
    dispatcher.dispatch(
      actionType: 'adx-global-attributes-setter'
      attributes: deviceDetailId: @props.data.pub_id
    )
    setTimeout(=>
      token = getCookie('___adxLoginToken')
      if token
        Turbolinks.visit('detail')
      else
        alert('you have to login first')
        Turbolinks.visit('sign-in')
    ,200)

  render: ->
    {data, featuredIcon} = @props

    <div className="col-sm-4">
      <div className="box-screen">
        <div className="box-img">
          <a onClick={@onSetDetail} href="javascript:void(0)"><img alt="#{data.pub_id}" src={data.primary_photo}/></a>
        </div>
        <div className="box-property">
          <h3 className="box-title">
            <a onClick={@onSetDetail} href="javascript:void(0)">{data.description}</a>
          </h3>

          <div className="capacity">
            <span>
              <img src={featuredIcon.employees}/>
              200-2000
            </span>
          </div>
          <div className="feature">
            <span>
              <img src={featuredIcon.tv} alt="#{data.pub_id}"/>Landscape
            </span>
          </div>
          <div className="clearfix"></div>

        </div>
        <div className="box-value">
          <span>{data.location}</span>
          <span>{data.property_type}</span>
          <span style={fontSize: '16px'}>
            <span style={display: 'inline-block'}>Avg Spending Rp. </span>
            <span style={display: 'inline-block'}>{Number(data.average_spending).toFixed(2)}</span>
            <span style={display: 'inline-block'}>/person</span>
          </span>
          <span style={fontSize: '16px'}>
            <span style={display: 'inline-block'}>Price Rp.</span>
            <span style={display: 'inline-block'}>{Number(data.price).toFixed(2)}</span>
          </span>
        </div>
      </div>
    </div>

window.FeaturedScreen = FeaturedScreen
