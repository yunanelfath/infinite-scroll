HeaderAdx = React.createClass
  PropTypes: {
    headerImage: React.PropTypes.object
  }
  
  render: ->
    { headerImage } = @props
    { adxLogo, signUpLogo } = headerImage

    <div className="header-adx">
      <div className="container">
        <div className="row">
          <div className="col-sm-4">
            <div className="logo-adx">
              <a href="javascript:void(0)"><img src="#{adxLogo}"/></a>
            </div>
          </div>
          <div className="col-sm-8">
            <div className="menu-top">
              <div className="menu-user">
                <a href="screen.html">Screen</a>
                <a href="learn-more.html">Learn More</a>
              </div>
              <div className="menu-action">
                <a href="signup.html"><img src="#{signUpLogo}" style={marginRight: '15px'}/>Sign Up</a>
                <a href="login.html" className="login">Log in</a>
              </div>
              <div className="clearfix"></div></div>
          </div>
        </div>
      </div>
    </div>
window.HeaderAdx = HeaderAdx
