SliderAdx = React.createClass
  PropTypes: {
    sliderImage: React.PropTypes.object
  }
  componentDidMount: ->
    $(ReactDOM.findDOMNode(@)).find('.owl-adx').owlCarousel({ items: 1,loop: true,autoplay: true,autoplayTimeout: 5000,autoplayHoverPause: true,dots: true})

  render: ->
    { sliderImage } = @props
    { first } = sliderImage

    <div className="slide-adx">
      <div className="owl-adx">
        <div className="item">
          <img src="#{first}"/>
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
                    <a href="screen.html" className="btn btn-screen">SEE SCREENS FOR MY ADS</a>
                  </div>
                  <div className="clearfix"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div className="item">
          <img src="#{first}"/>
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
                    <a href="screen.html" className="btn btn-screen">SEE SCREENS FOR MY ADS</a>
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
