featuredScreenState = ->
  {
    items: AdxWrapperStore.deviceListsFeatured
    requesting: AdxWrapperStore.requesting
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

  render: ->
    {data, featuredIcon} = @props

    <div className="col-sm-4">
      <div className="box-screen">
        <div className="box-img">
          <a href="#{data.public_url}"><img alt="#{data.pub_id}" src={data.primary_photo}/></a>
        </div>
        <div className="box-property">
          <h3 className="box-title">
            <a href="#{data.public_url}">{data.description}</a>
          </h3>

          <div className="capacity">
            <span>
              <img src={featuredIcon.employees}/>
              200-2000
              <span className="people-day">people/day</span>
            </span>
          </div>
          <div className="feature">
            <span>
              <img src={featuredIcon.tv} alt="#{data.pub_id}"/>Landscap Monitor
            </span>
          </div>
          <div className="clearfix"></div>

        </div>
        <div className="box-value">
          <span>{data.location}</span>
          <span>{data.property_type}</span>
          <span>Avg Spending Rp. {Number(data.average_spending).toFixed(2)}/person</span>
          <span>Price Rp.{Number(data.price).toFixed(2)}</span>
        </div>
      </div>
    </div>

window.FeaturedScreen = FeaturedScreen
