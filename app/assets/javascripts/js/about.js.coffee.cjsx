About = React.createClass
  PropTypes: {
    aboutImage: React.PropTypes.object
  }

  render: ->
    { aboutImage } = @props
    { itemImage } = aboutImage
    <div className="about-adx">
      <div className="container">
        <div className="col-sm-4">
          <div className="about-box">
            <img src="#{itemImage}"/>
            <div className="box-meta">
              <h3>1</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
            </div>
          </div>
        </div>
        <div className="col-sm-4">
          <div className="about-box">
            <img src="#{itemImage}"/>
            <div className="box-meta">
              <h3>1</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
            </div>
          </div>
        </div>
        <div className="col-sm-4">
          <div className="about-box">
            <img src="#{itemImage}"/>
            <div className="box-meta">
              <h3>1</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
window.About = About
