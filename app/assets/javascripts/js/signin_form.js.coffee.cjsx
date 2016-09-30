SigninForm = React.createClass
  getInitialState: ->
    {
      email: ''
      password: ''
      reconfirmPassword: ''
    }

  render: ->
    { email, password, reconfirmPassword } = @state

    <div className="account-container">
      <h2 className="title-account">Login to your account</h2>
      <form className="form-horizontal">
        <div className="form-group">
          <label className="col-sm-5 control-label">Email<span>:</span></label>
          <div className="col-sm-7">
            <input type="email" className="form-control" id="email" placeholder="Your Email Account" value={email}/>
          </div>
        </div>
        <div className="form-group">
          <label className="col-sm-5 control-label">Password<span>:</span></label>
          <div className="col-sm-7">
            <input type="password" className="form-control" id="password" placeholder="Your Password" value={password}/>
          </div>
        </div>
        <div className="form-group">
          <div className="col-sm-12">
            <div className="text-center mb40">
              <input type="submit" value="LOGIN" className="btn btn-submit"/>
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

window.SigninForm = SigninForm
