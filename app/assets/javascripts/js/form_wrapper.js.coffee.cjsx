FormWrapper = React.createClass
  PropTypes: {
    headerImage: React.PropTypes.object
    footerImage: React.PropTypes.object
    formType: React.PropTypes.string
  }

  render: ->
    { headerImage, footerImage, formType } = @props

    <div className="wrapper-adx-content">
      <HeaderAdx headerImage={headerImage} />
      <div className="content-screen">
        <div className="container">
          <div className="row">
            {
              if formType == 'signup'
                <SignupForm />
              else if formType == 'signin'
                <SigninForm />
            }
          </div>
        </div>
      </div>
      <FooterAdx footerImage={footerImage} />
    </div>

window.FormWrapper = FormWrapper
