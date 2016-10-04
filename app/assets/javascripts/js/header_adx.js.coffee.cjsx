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
    @setState(loggedIn: if token then true else false)

  _onChange: ->
    @setState(requesting: AdxWrapperStore.requesting)

  onLogoutClick: ->
    if @state.loggedIn
      eraseCookie('___adxLoginToken')

  render: ->
    { headerImage } = @props
    { requesting, loggedIn } = @state
    { adxLogo, signUpLogo } = headerImage

    <div>
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
                  <a href={if loggedIn then "javascript:void(0)" else "/sign-in"} onClick={@onLogoutClick} className="login" data-remote={false}>{if loggedIn then 'Log out' else 'Log in'}</a>
                </div>
                <div className="clearfix"></div></div>
            </div>
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
