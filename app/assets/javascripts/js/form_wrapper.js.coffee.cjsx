countDays = (from, to) =>
  Math.abs(Math.floor( from.getTime() / (3600*24*1000)) -  Math.floor( to.getTime() / (3600*24*1000)))

FormWrapper = React.createClass
  PropTypes: {
    headerImage: React.PropTypes.object
    footerImage: React.PropTypes.object
    formType: React.PropTypes.string
    defaultDetailImage: React.PropTypes.object
    learnMoreImage: React.PropTypes.object
  }

  contactUsForm: ->
    <div className="container">
      <div className="row">
        <div className="col-sm-12">
          <div className="contact-box">
             <h3 className="contact-title">SEND US AN EMAIL</h3>
             <div className="contact-table">
               <div className="contact-form">
                   <form className="form-horizontal">
                      <div className="form-group">
                         <label className="col-sm-2 control-label email">Email</label>
                         <div className="col-sm-10">
                            <input type="email" id="email" className="form-control"/>
                         </div>
                      </div>
                      <div className="form-group">
                         <label className="col-sm-2 control-label message">Message</label>
                         <div className="col-sm-10">
                            <textarea className="form-control" rows="10" cols="30" id="" name=""></textarea>
                         </div>
                      </div>
                      <div className="form-group form-label">
                         <div className="col-sm-offset-2 col-sm-10">
                            <label className="advertise">
                              <div className="icheckbox_minimal-grey" style={position: 'relative'}>
                                <input type="checkbox" id="advertise" style={position: 'absolute',top: '-20%', left: '-20%',display: 'block',width: '140%',height: '140%', margin: '0px',padding: '0px', background: 'rgb(255, 255, 255)', border: '0px none',opacity: '0'}/>
                                <ins className="iCheck-helper"
                                  style={position: 'absolute',top: '-20%',left: '-20%',display: 'block',width: '140%',height: '140%',margin: '0px',padding: '0px',background: 'rgb(255, 255, 255)', border: '0px none',opacity: '0'}></ins>
                              </div>
                              <span>I want to advertise</span>
                            </label>
                            <label className="screen">
                              <div className="icheckbox_minimal-grey" style={position: 'relative'}>
                                <input type="checkbox" id="screen"
                                  style={position: 'absolute',top: '-20%', left: '-20%',display: 'block',width: '140%',height: '140%', margin: '0px',padding: '0px', background: 'rgb(255, 255, 255)', border: '0px none',opacity: '0'}/>
                                <ins className="iCheck-helper"
                                  style={position: 'absolute',top: '-20%',left: '-20%',display: 'block',width: '140%',height: '140%',margin: '0px',padding: '0px',background: 'rgb(255, 255, 255)', border: '0px none',opacity: '0'}></ins>
                              </div>
                              <span>I want screen my place</span>
                            </label>
                         </div>
                      </div>
                      <div className="form-group">
                         <div className="col-sm-offset-2 col-sm-10">
                            <input type="submit" className="btn btn-submit pull-right" value="SEND"/>
                         </div>
                      </div>
                   </form>
                </div>
                <div className="contact-address">
                  <div className="box-address">
                    <span>ADX</span>
                    <span>The Impact Hub</span>
                    <span>128 Prinsep Street, Singapore</span>
                    <div>
                       <span>+65 8422 8357 (Singapore)</span>
                       <span>+62 813 185 10160 (Indonesia)</span>
                    </div>
                    <span>
                      <a href="mailto:elbert.toha@10adx.com">elbert.toha@10adx.com</a>
                    </span>
                  </div>
                </div>
             </div>
          </div>
        </div>
      </div>
    </div>

  mainPhotoForm: (image)->
    <div className="container">
      <div className="row">
        <div className="col-sm-12">
          <div className="main-photo-table">
            <div className="main-desc">
              <div className="main-desc-wrap">
                 <p className="main-tagline">designed for every bussiness owners</p>
                 <p className="main-text">
                    <span className="brand">adx</span>
                    is an effective , affordable offline advertising platform.
                 </p>
                 <div className="line-white"></div>
                 <div className="main-desc-sub">
                    <p>Make your offline campaign in our network for as low as Rp.25.000 instead of Rp.250.000.000 in normal advertising agencies.</p>
                    <p>Or you can join in our network and earn up Rp. 30 million per month. This is your way to monetize your place.</p>
                 </div>
                 <div className="row">
                    <div className="col-sm-6">
                       <a className="btn btn-main" href="">ADVERTISE</a>
                    </div>
                    <div className="col-sm-6">
                       <a className="btn btn-main" href="">MONETIZE</a>
                    </div>
                 </div>
              </div>
            </div>
            <div className="main-pic">
              <img src={image.bigTv}/>
            </div>
          </div>
        </div>
      </div>
    </div>

  howTodoForm: ->
    <div className="container">
      <div className="row">
        <div className="col-sm-12">
          <p>So you want your ads on screen at malls, office buildings and restaurants/cafes. Here s how you can do it:</p>
        </div>
      </div>
    </div>

  theWaysForm: (image) ->
    <div className="container">
      <div className="row">
        <div className="col-sm-12">
          <img src={image.theWays} className="vs" />
          <div className="the-way-table">
            <div className="the-way-left">
              <p className="the-way-sub">Call the number on the display (usually refers to advertising agency or the place owner). They will sell the spots in bundle (for example at 130 locations for minimum 3 weeks).</p>
              <p className="the-way-main">For this bundled offer, they quote more than Rp250 million (SGD 25.000+). It is an expensive way to advertise!</p>
            </div>
            <div className="img-vs-wrap">
              <img src={image.theWays} className="vs-mobile"/>
            </div>
            <div className="the-way-right">
              <p className="the-way-sub">Browse our web, select location and date, upload the content, and you are done. It is all under 3 minutes. <br/>Your content will be displayed on designated screen during the days you selected, automatically. No bundle, no minimum number of spots, no minimum period.</p>
              <p className="the-way-main">You can select screen on daily basis for as low as Rp25.000 (SGD2.5)/SCREEN/DAY. It is convenient and affordable.</p>
            </div>
          </div>
        </div>
      </div>
    </div>

  benefitad2Form: (image) ->
    <div className="container">
      <div className="row">
        <div className="col-sm-12">
          <h2 className="benefit-text">Benefit for Advertiser</h2>
          <p className="arrow-title-down"><i className="fa fa-angle-down"></i></p>
          <div className="benefit-table">
            <div className="benefit-l">
              <img src={image.dollar} />
              <h3>affordable</h3>
              <p>Pay what you need. Bo bundle, no minimum period, and no minimum spot. it is as low as Rp. 25.000 (SGD 2.5)</p>
            </div>
            <div className="benefit-c">
              <img src={image.calendar} />
              <h3>flexible</h3>
              <p>Change your advertisement every day. Stay relevant and test effectiveness. No additional cost. No hassle.</p>
            </div>
            <div className="benefit-r">
              <img src={image.diagram}/>
              <h3>measurable</h3>
              <p>Add unique Call-To-Action to each screen. Measure which screen gives most lead and sales.</p>
            </div>
          </div>
        </div>
      </div>
    </div>

  benefitad1Form: (image) ->
    <div className="container">
      <div className="row">
        <div className="col-sm-12">
          <h2 className="benefit-text">Benefit for Place Owners</h2>
          <p className="arrow-title-down"><i className="fa fa-angle-down"></i></p>
          <div className="benefit-table">
            <div className="benefit-l">
              <img src={image.pig} />
              <h3>New Revenue Source</h3>
              <p>Monetize your empty walls and earn additional revenue up to Rp30 million (SGD3,000) per month.</p>
            </div>
            <div className="benefit-c">
              <img src={image.coffee} />
              <h3>Risk Free</h3>
              <p>Spend no money / investment. We will provide the TV screen for you, free of charge. No risks.</p>
            </div>
            <div className="benefit-r">
              <img src={image.staff}/>
              <h3>Self Utilizable</h3>
              <p>Utilize the screen to promote your own programs, products, or your special menu. Boost your own sales.</p>
            </div>
          </div>
        </div>
      </div>
    </div>

  wallMatterForm: ->
    <div className="container">
      <div className="row">
        <div className="col-sm-12">
          <h2 className="big-wall">WALL MATTER</h2>
          <p className="wall-box">
            If you have empty walls that has traffic, let us know and we will help you put up screens.
          </p>
          <p className="wall-text">
            We will provide the TV screen and all necessary tools to get you up and running. <br/>
            The screen will display advertisings from our ad purchasers. <br/>
            You will have the final approval of all advertisings. <br/>
            No advertisement will be displayed without your permissions. <br/> <br/>

            The only thing that you need to provide is power socket for the TV and internet (Wi-Fi is preferred) to run the application.
          </p>
        </div>
      </div>
    </div>

  _onDeviceChanged: (attributes) ->
    dispatcher.dispatch(
      actionType: 'adx-global-attributes-setter'
      attributes: attributes
    )

  onChangeInputFile: (event) ->
    try
      file = event.target.files[0]
    catch e
      return false

    srcUrl = URL.createObjectURL(file)

    $(ReactDOM.findDOMNode(@refs.adsPaymentForm)).find('.ad-detail').find('.ad-display img').attr('src',srcUrl)
    params = AdxWrapperStore.deviceDetailContent
    params.imageFile = file
    @_onDeviceChanged(params)


  onChangeStartDate: (event) ->
    params = AdxWrapperStore.deviceDetailContent
    if params?.startDate != event.target.value
      params.startDate = event.target.value
      @_onDeviceChanged(params)

  onChangeEndDate: (event) ->
    params = AdxWrapperStore.deviceDetailContent
    if params?.endDate != event.target.value
      params.endDate = event.target.value
      @_onDeviceChanged(params)

  onDidChangeEndDate: (data) ->
    params = AdxWrapperStore.deviceDetailContent
    params.unAvailableDates = data.unAvailableDates
    params.availableDates = data.availableDates
    @_onDeviceChanged(params)

  render: ->
    { headerImage, footerImage, formType } = @props

    <div className="wrapper-adx-content">
      <HeaderAdx headerImage={headerImage} />
      {
        if formType == 'learn-more'
          contactUsForm = @contactUsForm()
          mainPhotoForm = @mainPhotoForm(@props.learnMoreImage)
          howTodoForm = @howTodoForm()
          theWaysForm = @theWaysForm(@props.learnMoreImage)
          benefitAd1 = @benefitad1Form(@props.learnMoreImage)
          benefitAd2 = @benefitad2Form(@props.learnMoreImage)
          wallMatterForm = @wallMatterForm()
          <div className="learn-more">
            <div className="main-photo">
              {mainPhotoForm}
            </div>
            <div className="how-todo">
              {howTodoForm}
            </div>
            <div className="the-ways">
              {theWaysForm}
            </div>
            <div className="benefit-ad">
              {benefitAd2}
            </div>
            <div className="wall-matter">
              {wallMatterForm}
            </div>
            <div className="benefit-ad">
              {benefitAd1}
            </div>
            <div className="contact-us">
              {contactUsForm}
            </div>
          </div>
        else
          if formType == 'detail'
            <div className="content-screen">
              <div className="container">
                <DetailDescription defaultDetailImage={@props.defaultDetailImage}/>
              </div>
              <DateAvailablelityForm onChangeEndDate={@onChangeEndDate}
                onDidChangeEndDate={@onDidChangeEndDate}
                onChangeStartDate={@onChangeStartDate}/>
              <AdsPaymentForm ref="adsPaymentForm" onSubmitForm={@onSubmitForm} onChangeInputFile={@onChangeInputFile}/>
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
