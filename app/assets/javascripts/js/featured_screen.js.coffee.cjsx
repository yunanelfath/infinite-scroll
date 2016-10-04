{ OverlayTrigger, Tooltip } = ReactBootstrap
toCurrencyRp = (num) ->
  return 'Rp. 0.0' if num == null || num == undefined
  num = Number(Math.round(num + 'e2') + 'e-2')
  "Rp. #{num.toLocaleString('en-US')}"

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
        swal(
          {
            title: 'You have to login first!'
            text: 'You will not be able to view this feature.'
            type: 'warning'
            showCancelButton: true
          }
          (e) ->
            if e
              Turbolinks.visit('sign-in')
            else
              swal('Cancelled', "You can't access this feature.",'error')
        )
    ,200)

  render: ->
    {data, featuredIcon} = @props

    employeesTooltip = <Tooltip id="employees-tooltip-#{data.pub_id}">People/day</Tooltip>
    monitorTooltip = <Tooltip id="people-tooltip-#{data.pub_id}">Landscape Monitor</Tooltip>

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
            <OverlayTrigger placement="top" overlay={employeesTooltip}>
              <span>
                <img src={featuredIcon.employees}/>
                200-2000
              </span>
            </OverlayTrigger>
          </div>
          <div className="feature">
            <OverlayTrigger placement="top" overlay={monitorTooltip}>
              <span>
                <img src={featuredIcon.tv} alt="#{data.pub_id}"/>Landscape
              </span>
            </OverlayTrigger>
          </div>
          <div className="clearfix"></div>

        </div>
        <div className="box-value">
          <span>{data.location}</span>
          <span>{data.property_type}</span>
          <span style={fontSize: '16px'}>
            <span style={display: 'inline-block'}>Avg Spending Rp. </span>
            <span style={display: 'inline-block'}>{toCurrencyRp(data.average_spending)}</span>
            <span style={display: 'inline-block'}>/person</span>
          </span>
          <span style={fontSize: '16px'}>
            <span style={display: 'inline-block'}>Price Rp.</span>
            <span style={display: 'inline-block'}>{toCurrencyRp(data.price)}</span>
          </span>
        </div>
      </div>
    </div>

window.FeaturedScreen = FeaturedScreen
