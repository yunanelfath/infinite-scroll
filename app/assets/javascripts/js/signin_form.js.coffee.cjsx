SigninForm = React.createClass
  getInitialState: ->
    {
      email: ''
      password: ''
      isCookieLogin: JSON.parse(getCookie('___adxLoginToken'))
      isLoggedIn: false
    }


  componentDidMount: ->
    @listener = AdxWrapperStore.addChangeListener(@_onChange)

  componentWillUnmount: ->
    @listener.remove()

  _onChange: ->
    @setState(isCookieLogin: JSON.parse(getCookie('___adxLoginToken')))

  onChangePassword: (event) ->
    @setState(password: event.target.value)

  onChangeEmail: (event) ->
    @setState(email: event.target.value)

  onLoginClick: (event) ->
    _this = @
    $.ajax
      url: "https://sandbox.10adx.com/api/token-auth/"
      data: email: _this.state.email, password: _this.state.password
      method: "POST"
      success: (data) ->
        setCookie('___adxLoginToken', JSON.stringify({token: "Bearer #{data.token}", email: _this.state.email}))
        _this.setState(isLoggedIn: true)

  render: ->
    { email, password, isCookieLogin, isLoggedIn } = @state

    <div className="account-container">
      {
        if isCookieLogin || isLoggedIn
          <div>
            <h2 className="title-account">Youve log on to your account</h2>
            <p className="note-account">
              <a href="/">Click here to return to our homepage</a>
            </p>
          </div>
        else
          <div>
            <h2 className="title-account">Login to your account</h2>
            <form className="form-horizontal">
              <div className="form-group">
                <label className="col-sm-5 control-label">Email<span>:</span></label>
                <div className="col-sm-7">
                  <input onChange={@onChangeEmail} type="email" className="form-control" id="email" placeholder="Your Email Account" value={email}/>
                </div>
              </div>
              <div className="form-group">
                <label className="col-sm-5 control-label">Password<span>:</span></label>
                <div className="col-sm-7">
                  <input onChange={@onChangePassword} type="password" className="form-control" id="password" placeholder="Your Password" value={password}/>
                </div>
              </div>
              <div className="form-group">
                <div className="col-sm-12">
                  <div className="text-center mb40">
                    <input type="button" value="LOGIN" className="btn btn-submit" onClick={@onLoginClick}/>
                  </div>
                </div>
              </div>
            </form>
            <div className="line-login mb40"></div>
            <p className="has-account">
              <a href="javascript:void(0)">Forgot Password? Click here!</a>
              <br/>
              <br/>
              Have no account?
              <a href="/sign-up" data-remote={false}>Sign up here!</a>
            </p>
          </div>
      }
    </div>

window.SigninForm = SigninForm
