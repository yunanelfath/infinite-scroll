FeaturedScreen = React.createClass
  getInitialState: ->
    {
      items: FeaturedScreenStore.items
      requesting: FeaturedScreenStore.requesting
    }

  componentDidMount: ->
    @listener = FeaturedScreenStore.addChangeListener(@_onChange)

  componentWillUnmount: ->
    @listener.remove()

  _onChange: ->
    @setState(
      items: FeaturedScreenStore.items
      requesting: FeaturedScreenStore.requesting
    )

  render: ->
    { items } = @state

    <div className="featured-screen wrapper-box">
      <div className="container">
        <div className="row">
          <div className="col-xs-12">
          <h2 className="featured-text-title text-center">featured screen</h2>
          </div>
          <div className="clearfix"></div>
          <div>
            <div className="col-sm-4">
              <div className="box-screen">
                <div className="box-img">
                  <a href="screen-detail.html"><img alt="" src={null}/></a>
                </div>
                <div className="box-property">
                  <h3 className="box-title">
                    <a href="screen-detail.html">Lorem ipsum dolor si amet lay nsd</a>
                  </h3>

                  <div className="capacity">
                    <span>
                      <img src={"img/icon/employees.png"}/>
                      200-2000
                      <span className="people-day">people/day</span>
                    </span>
                  </div>
                  <div className="feature">
                    <span>
                      <img alt="" src="img/icon/television.png"/>Landscap Monitor
                    </span>
                  </div>
                  <div className="clearfix"></div>

                </div>
                <div className="box-value">
                  <span>Lippo Mall Puri Jakarta</span>
                  <span>Cafe</span>
                  <span>Avg Spending Rp. 50.000/person</span>
                  <span>Price Rp.20.000 - Rp.100.000</span>
                </div>
              </div>
            </div>
          </div>
          <div className="col-xs-12">
            <a className="btn btn-more" href="screen.html">see more</a>
          </div>
        </div>
      </div>
    </div>
window.FeaturedScreen = FeaturedScreen
