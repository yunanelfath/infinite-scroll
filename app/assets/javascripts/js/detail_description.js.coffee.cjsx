DetailDescription = React.createClass
  PropTypes: {
    defaultDetailImage: React.PropTypes.object
  }

  render: ->
    <div className="row">
      <div className="col-sm-12">
        <div className="page-wrap">
          <h3 className="page-sub">Screen Detail</h3>
          <h1 className="page-title">D Journal Coffee Bar Cilandak Townsquare</h1>
        </div>
        <div className="page-content">
          <div className="row">
            <div className="col-sm-6">
              <div className="gallery-adx">
                <div className="row">
                  <div className="col-sm-6"><img src={@props.defaultDetailImage.item} className="image-responsive"/></div>
                  <div className="col-sm-6"><img src={@props.defaultDetailImage.item} className="image-responsive"/></div>
                  <div className="col-sm-6"><img src={@props.defaultDetailImage.item} className="image-responsive"/></div>
                  <div className="col-sm-6"><img src={@props.defaultDetailImage.item} className="image-responsive"/></div>
                  <div className="col-sm-6"><img src={@props.defaultDetailImage.item} className="image-responsive"/></div>
                  <div className="col-sm-6"><img src={@props.defaultDetailImage.item} className="image-responsive"/></div>
                </div>
              </div>
            </div>
            <div className="col-sm-6">
              <div className="page-wrap">
                <h3 className="page-sub">Description</h3>
                <span className="meta-feature">
                  <span>
                    <img src={@props.defaultDetailImage.employees}/>
                    200-1000 people/day
                  </span>
                </span>
                <span className="meta-feature">
                  <span>
                    <img src={@props.defaultDetailImage.tv}/>
                    Landscape monitor
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
                    <span>Lippo Mall Puri, Jakarta Barat</span>
                  </div>
                </div>
                <div className="meta-table">
                  <div className="meta-title">
                    <span>Property Type</span>
                  </div>
                  <div className="meta-value">
                    :&nbsp;
                    <span>Cafe</span>
                  </div>
                </div>
                <div className="meta-table">
                  <div className="meta-title">
                    <span>Avg. Spending</span>
                  </div>
                  <div className="meta-value">
                    :&nbsp;
                    <span>Rp. 5000/person</span>
                  </div>
                </div>
                <div className="meta-table">
                  <div className="meta-title">
                    <span>Price</span>
                  </div>
                  <div className="meta-value">
                    :&nbsp;
                    <span>Rp. 20.000 - Rp. 100.000</span>
                  </div>
                </div>
              </div>
              <div className="meta-description">
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet necessitatibus nisi dolorem harum itaque molestiae temporibus, debitis natus ipsa perferendis, mollitia veritatis provident neque, illo modi reprehenderit quam aspernatur? Obcaecati!</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet necessitatibus nisi dolorem harum itaque molestiae temporibus, debitis natus ipsa perferendis, mollitia veritatis provident neque, illo modi reprehenderit quam aspernatur? Obcaecati!</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

window.DetailDescription = DetailDescription
