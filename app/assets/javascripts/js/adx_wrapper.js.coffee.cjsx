AdxWrapper = React.createClass
  PropTypes: {
    headerImage: React.PropTypes.object
    footerImage: React.PropTypes.object
    contentImage: React.PropTypes.object
    aboutImage: React.PropTypes.object
    sliderImage: React.PropTypes.object
  }

  render: ->
    { sliderImage, headerImage, footerImage, contentImage, aboutImage } = @props
    { middleImage } = contentImage
    <div className="wrapper-adx">
      <HeaderAdx headerImage={headerImage} />
      <SliderAdx sliderImage={sliderImage} />
      <IntroAdx />
      <FeaturedScreen />
      <About aboutImage={aboutImage} />
      <FooterAdx footerImage={footerImage} />
    </div>

window.AdxWrapper = AdxWrapper
