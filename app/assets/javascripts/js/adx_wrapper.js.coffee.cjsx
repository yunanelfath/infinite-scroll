AdxWrapper = React.createClass
  PropTypes: {
    headerImage: React.PropTypes.object
    footerImage: React.PropTypes.object
    contentImage: React.PropTypes.object
    aboutImages: React.PropTypes.array
    sliderImage: React.PropTypes.object
    featuredIcon: React.PropTypes.object
  }

  onClickMoreFeaturedScreen: ->
    deviceListLoadRequest()

  render: ->
    { sliderImage, headerImage, footerImage,
      featuredIcon,
      contentImage, aboutImages } = @props
    { middleImage } = contentImage

    <div className="wrapper-adx-content">
      <HeaderAdx headerImage={headerImage} />
      <SliderAdx sliderImage={sliderImage} />
      <IntroAdx />
      <About aboutImages={aboutImages} />
      <div className="featured-screen wrapper-box">
        <div className="container">
          <div className="row">
            <div className="col-xs-12">
              <h2 className="featured-text-title text-center">featured screen</h2>
            </div>
            <div className="clearfix"></div>
            <FeaturedScreen ref="featuredScreen" featuredIcon={featuredIcon}/>
            <div className="col-xs-12">
              <a className="btn btn-more" href="javascript:void(0)" onClick={@onClickMoreFeaturedScreen}>see more</a>
            </div>
          </div>
        </div>
      </div>
      <FooterAdx footerImage={footerImage} />
    </div>

window.AdxWrapper = AdxWrapper
