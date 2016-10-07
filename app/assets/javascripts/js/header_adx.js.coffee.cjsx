HeaderAdx = React.createClass
  PropTypes: {
    headerImage: React.PropTypes.object
  }

  getInitialState: ->
    {
      requesting: AdxWrapperStore.requesting
      loggedIn: false
    }

  componentDidMount: ->
    @listener = AdxWrapperStore.addChangeListener(@_onChange)
    @listener2 = @_onLoggedIn()

  componentWillUnmount: ->
    @listener.remove()
    @listener2.remove()

  _onLoggedIn: ->
    token = getCookie('___adxLoginToken')
    @setState(loggedIn: if token then {status: true, email: token?.email} else false)

  _onChange: ->
    @setState(requesting: AdxWrapperStore.requesting)

  onLogoutClick: ->
    if @state.loggedIn
      eraseCookie('___adxLoginToken')

  render: ->
    { headerImage } = @props
    { requesting, loggedIn, desktopView } = @state
    { adxLogo, signUpLogo } = headerImage

    <div>
      <div className="header-adx">
        <div className="container hidden-sm hidden-xs">
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
                  {
                    if loggedIn
                      <a style={overflow: 'hidden',textOverflow: 'ellipsis', whiteSpace: 'nowrap', width: '185px'} href="javascript:void(0)" data-remote={false}><img src="#{signUpLogo}" style={marginRight: '15px'}/>{loggedIn?.email}</a>
                    else
                      <a href="/sign-up" data-remote={false}><img src="#{signUpLogo}" style={marginRight: '15px'}/>Sign Up</a>
                  }
                  <a href={if loggedIn then "javascript:void(0)" else "/sign-in"} onClick={@onLogoutClick} className="login" data-remote={false}>{if loggedIn then 'Log out' else 'Log in'}</a>
                </div>
                <div className="clearfix"></div></div>
            </div>
          </div>
        </div>
        <div className="container hidden-md hidden-lg">
          <div className="navbar-header">
            <a href="javascript:void(0)"><img style={width: '45%',marginLeft: '10px', marginTop: '5px'} src="#{adxLogo}"/></a>
            <button style={background: '#fff'} className="navbar-toggle collapsed" data-target="#navbar" data-toggle="collapse" aria-controls="navbar" aria-expanded="false">
              <span className="glyphicon glyphicon-chevron-down"></span>
            </button>
          </div>
          <div id="navbar" className="navbar-collapse collapse" style={height: '1px'}>
            <ul className="nav navbar-nav navbar-right navbar-override-hover">
              <li>
                <a href="/screens">SCREEN</a>
              </li>
              <li>
                <a href="/learn-more">LEARN MORE</a>
              </li>
              <li>
                {
                  if loggedIn
                    <a href="javascript:void(0)">loggedIn?.email</a>
                  else
                    <a href="/sign-up">SIGN UP</a>
                }
              </li>
              <li>
                <a href="/sign-in">LOGIN</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
      {
        if requesting.status
          <div>
            <div style={zIndex: '40',opacity: '0.5',top: '0',position: 'fixed',height: '100%',width: '100%',background: '#fff',textAlign: 'center'}></div>
            <div style={zIndex: '50',position: 'fixed',top: '50%',left: '50%',fontSize: '25px'}>Please wait..</div>
          </div>
      }
    </div>
window.HeaderAdx = HeaderAdx
