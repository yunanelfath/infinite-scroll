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
                <a href="/screens" data-remote={false}>Screen</a>
                <a href="/learn-more" data-remote={false}>Learn More</a>
              </div>
              <div className="menu-action">
                <a href="/sign-up" data-remote={false}><img src="#{signUpLogo}" style={marginRight: '15px'}/>Sign Up</a>
                <a href="/sign-in" className="login" data-remote={false}>Log in</a>
              </div>
              <div className="clearfix"></div></div>
          </div>
        </div>
      </div>
    </div>
window.HeaderAdx = HeaderAdx
