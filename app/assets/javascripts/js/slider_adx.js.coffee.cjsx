TABLET_MAX_SIZE = 991
SliderAdx = React.createClass
  PropTypes: {
    sliderImage: React.PropTypes.object
  }

  getInitialState: ->
    {
      desktopView: false
      heightElement: []
    }

  componentDidMount: ->
    $(window).on('resize.slider_adx', $.proxy(@onWindowResize, @))
    $(window).on('load.slider_adx', $.proxy(@onWindowResize, @))

  componentWillUnmount: ->
    $(window).off('resize.slider_adx')
    $(window).off('load.slider_adx')

  onWindowResize: ->
    desktopView = ($(window).width() > TABLET_MAX_SIZE)
    _this = @
    heightElement = []
    setTimeout(=>
      unless desktopView
        _.map($(ReactDOM.findDOMNode(_this)).find('.item'), (e) ->
          heightElement.push($(e).find('.slide-text').height())
          console.log heightElement
        )
      _this.setState(desktopView: desktopView, heightElement: heightElement)
      setTimeout(=>
        $(ReactDOM.findDOMNode(_this)).find('.owl-adx').owlCarousel({ items: 1,loop: true,autoplay: true,autoplayTimeout: 5000,autoplayHoverPause: true,dots: true})
      ,900)
    ,800)


  render: ->
    { desktopView, heightElement } = @state
    { sliderImage } = @props
    { first } = sliderImage

    <div className="slide-adx">
      <div className="owl-adx">
        <div className="item" style={if !desktopView then {borderTop: '0.1px groove #fff', background:  '#843c0c',width: '100%', height: "#{heightElement[0]}px"}}>
          <img src="#{first}" className="hidden-xs hidden-sm"/>
          <div className="slide-text">
            <div className="container">
              <div className="row">
                <div className="col-sm-12">
                  <div className="slide-wrap">
                    <h2>
                      <span>YOUR ADS asdf asdf asd</span>
                      Thousand Eyes
                    </h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid magnam, excepturi quisquam labore fugiat maiores tempore recusandae error. Saepe veniam illum suscipit fuga incidunt id esse, nam dicta amet maiores.</p>
                    <div className="mb150"></div>
                    <a href="screens.html" className="btn btn-screen">SEE SCREENS FOR MY ADS</a>
                  </div>
                  <div className="clearfix"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div className="item" style={if !desktopView then {borderTop: '0.1px groove #fff', background:  '#843c0c',width: '100%', height: "#{heightElement[1]}px"}}>
          <img src="#{first}" className="hidden-xs hidden-sm"/>
          <div className="slide-text">
            <div className="container">
              <div className="row">
                <div className="col-sm-12">
                  <div className="slide-wrap">
                    <h2>
                      <span>YOUR ADS</span>
                      Thousand Eyes
                    </h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid magnam, excepturi quisquam labore fugiat maiores tempore recusandae error. Saepe veniam illum suscipit fuga incidunt id esse, nam dicta amet maiores.</p>
                    <div className="mb150"></div>
                    <a href="screens.html" className="btn btn-screen">SEE SCREENS FOR MY ADS</a>
                  </div>
                  <div className="clearfix"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
window.SliderAdx = SliderAdx
