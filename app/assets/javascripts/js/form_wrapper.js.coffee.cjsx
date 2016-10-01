FormWrapper = React.createClass
  PropTypes: {
    headerImage: React.PropTypes.object
    footerImage: React.PropTypes.object
    formType: React.PropTypes.string
    defaultDetailImage: React.PropTypes.object
  }

  dateAvailabelityForm: ->
    <div className="container">
      <div className="row">
        <div className="col-sm-12">
          <div className="page-av-table">
            <div className="page-av-left">
              <p className="p-relative">Pick start and end date for your ad:</p>
            </div>
            <div className="page-av-right">
              <div className="form-group">
                <label>START DATE</label>
                <div className="has-input has-icon has-calendar">
                  <input type="text" className="form-control" id="startDate" placeholder="Pick Date"/>
                </div>
              </div>
              <div className="form-group">
                <label>END DATE</label>
                <div className="has-input has-icon has-calendar">
                  <input type="text" className="form-control" id="endDate" placeholder="Pick Date"/>
                </div>
              </div>
            </div>
          </div>
          <div className="page-av-table">
            <div className="page-av-left">
              <p>There are unavailable date(s) based on your choice</p>
            </div>
            <div className="page-av-right">
              <span className="date-availability">20 November 2016</span>
              <span className="date-availability">20 November 2016</span>
            </div>
          </div>
        </div>
      </div>
    </div>

  render: ->
    { headerImage, footerImage, formType } = @props

    <div className="wrapper-adx-content">
      <HeaderAdx headerImage={headerImage} />
      {
        if formType == 'learn-more'
          <div className="learn-more"></div>
        else
          if formType == 'detail'
            dateAvailabelityForm = @dateAvailabelityForm()
            <div className="content-screen">
              <div className="container">
                <DetailDescription defaultDetailImage={@props.defaultDetailImage}/>
              </div>
              <div className="page-availability">
                {dateAvailabelityForm}
              </div>
              <div className="ads-payment"></div>
            </div>
          else
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
      }
      <FooterAdx footerImage={footerImage} />
    </div>

window.FormWrapper = FormWrapper
