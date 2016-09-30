ScreenWrapper = React.createClass
  PropTypes: {
    introScreen: React.PropTypes.object.isRequired
    headerImage: React.PropTypes.object
    footerImage: React.PropTypes.object
    featuredIcon: React.PropTypes.object
  }

  onClickMoreDevicesScreen: ->
    deviceListLoadRequest()

  render: ->
    { introScreen, featuredIcon, headerImage, footerImage } = @props
    { pcIcon } = introScreen

    <div className="wrapper-adx">
      <HeaderAdx headerImage={headerImage} />
      <div className="content-screen">
        <div className="container">
          <div className="row">
            <div className="col-sm-12">
              <IntroScreen icon={pcIcon}/>
            </div>
            <div className="col-sm-13 col-md-2"></div>
            <div className="col-sm-9 col-md-10">
              <FeaturedScreen ref="featuredScreen" featuredIcon={featuredIcon}/>
            </div>
            <div className="col-xs-12">
              <a href="javascript:void(0)" onClick={@onClickMoreDevicesScreen} className="btn btn-more">LOAD MORE</a>
            </div>
          </div>
        </div>
      </div>
      <FooterAdx footerImage={footerImage} />
    </div>

IntroScreen = React.createClass
  PropTypes: {
    icon: React.PropTypes.string.isRequired
  }

  render: ->
    <div className="intro-screen text-center">
      <img src={@props.icon}/>
      <p>Choose the most suitable screen for your ads. Start from Rp. 15.000/day</p>
    </div>

window.ScreenWrapper = ScreenWrapper
