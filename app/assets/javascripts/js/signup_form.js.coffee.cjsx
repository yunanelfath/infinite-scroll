SignupForm = React.createClass
  getInitialState: ->
    {
      email: ''
      password: ''
      reconfirmPassword: ''
    }

  render: ->
    { email, password, reconfirmPassword } = @state

    <div className="account-container">
      <h2 className="title-account">Sign up and start posting your ad in our screens</h2>
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
          <label className="col-sm-5 control-label">Retype Password<span>:</span></label>
          <div className="col-sm-7">
            <input type="password" className="form-control" id="retype" placeholder="Retype your password" value={reconfirmPassword}/>
          </div>
        </div>
        <div className="form-group">
          <div className="col-sm-12">
            <div className="text-center mb40">
              <input type="submit" value="SIGNUP" className="btn btn-submit"/>
            </div>
          </div>
        </div>
      </form>
      <div className="line-login mb40"></div>
      <p className="has-account">
        Already sign up?
        <a href="/sign-in" data-remote={false}>Log In here!</a>
      </p>
    </div>

window.SignupForm = SignupForm
