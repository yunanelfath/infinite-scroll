HeaderAdx = React.createClass
  PropTypes: {
    headerImage: React.PropTypes.object
  }

  getInitialState: ->
    {
      requesting: AdxWrapperStore.requesting
      isLoggedIn: AdxWrapperStore.isLoggedIn
    }

  componentDidMount: ->
    @listener = AdxWrapperStore.addChangeListener(@_onChange)

  componentWillUnmount: ->
    @listener.remove()

  _onChange: ->
    @setState(requesting: AdxWrapperStore.requesting, isLoggedIn: AdxWrapperStore.isLoggedIn)

  onLogoutClick: ->
    if @state.isLoggedIn
      eraseCookie('___adxLoginToken')
      eraseCookie('___adxDetailIdToken')
      swal(
        {
          title: 'Thanks'
          text: 'You successfully log out'
          type: 'success'
        }
        (e) ->
          dispatcher.dispatch(
            actionType: 'adx-global-attributes-setter'
            attributes: {isLoggedIn: {status: false, email: null}}
          )
          setTimeout(=>
            window.location.href = if window.location.href.match(".html") == null then "/" else "index.html"
          ,800)
      )

  render: ->
    { headerImage } = @props
    { requesting, isLoggedIn, desktopView } = @state
    { adxLogo, signUpLogo } = headerImage

    headerUrl = {}
    headerUrl.screens = if window.location.href.match(".html") == null then "/screens/" else "screens.html"
    headerUrl.learnmore = if window.location.href.match(".html") == null then "/learn-more/" else "learn-more.html"
    headerUrl.signup = if window.location.href.match(".html") == null then "/sign-up/" else "sign-up.html"
    headerUrl.signin = if window.location.href.match(".html") == null then "/sign-in/" else "sign-in.html"
    headerUrl.index = if window.location.href.match(".html") == null then "/" else "index.html"


    <div>
      <div className="header-adx">
        <div className="container hidden-sm hidden-xs">
          <div className="row">
            <div className="col-sm-4">
              <div className="logo-adx">
                <a href="#{headerUrl.index}"><img src="#{adxLogo}"/></a>
              </div>
            </div>
            <div className="col-sm-8">
              <div className="menu-top">
                <div className="menu-user">
                  <a href="#{headerUrl.screens}" data-remote={false}>Screen</a>
                  <a href="#{headerUrl.learnmore}" data-remote={false}>Learn More</a>
                </div>
                <div className="menu-action">
                  {
                    if isLoggedIn?.status
                      <div style={display: 'table'}>
                        <a style={overflow: 'hidden',textOverflow: 'ellipsis', whiteSpace: 'nowrap', width: '185px'} href="javascript:void(0)" data-remote={false}><img src="#{signUpLogo}" style={marginRight: '15px'}/>{isLoggedIn?.email}</a>
                        <a style={paddingTop: '0', display: 'table-cell', verticalAlign: 'middle'} href="javascript:void(0)" onClick={@onLogoutClick} className="login" data-remote={false}>Log out</a>
                      </div>
                    else
                      <div style={display: 'table'}>
                        <a href="#{headerUrl.signup}" data-remote={false}><img src="#{signUpLogo}" style={marginRight: '15px'}/>Sign Up</a>
                        <a style={paddingTop: '0', display: 'table-cell', verticalAlign: 'middle'} href="#{headerUrl.signin}" className="login" data-remote={false}>Log in</a>
                      </div>
                  }
                </div>
                <div className="clearfix"></div></div>
            </div>
          </div>
        </div>
        <div className="container hidden-md hidden-lg">
          <div className="navbar-header">
            <a href="#{headerUrl.index}"><img style={width: '45%',marginLeft: '10px', marginTop: '5px'} src="#{adxLogo}"/></a>
            <button style={background: '#fff'} className="navbar-toggle collapsed" data-target="#navbar" data-toggle="collapse" aria-controls="navbar" aria-expanded="false">
              <span className="glyphicon glyphicon-chevron-down"></span>
            </button>
          </div>
          <div id="navbar" className="navbar-collapse collapse" style={height: '1px'}>
            <ul className="nav navbar-nav navbar-right navbar-override-hover">
              <li>
                <a href="#{headerUrl.screens}">SCREEN</a>
              </li>
              <li>
                <a href="#{headerUrl.learnmore}">LEARN MORE</a>
              </li>
              {
                if isLoggedIn?.status
                  <li><a href="javascript:void(0)">{isLoggedIn?.email.toString().toUpperCase()}</a></li>
              }
              {
                if isLoggedIn?.status
                  <li><a onClick={@onLogoutClick} href="javascript:void(0)">LOG OUT</a></li>
              }
              {
                unless isLoggedIn?.status
                  <li><a href="#{headerUrl.signup}">SIGN UP</a></li>
              }
              {
                unless isLoggedIn?.status
                  <li><a href="#{headerUrl.signin}">LOGIN</a></li>
              }
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
