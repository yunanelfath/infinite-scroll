LatestHotel = React.createClass
  propTypes:
    sliders: React.PropTypes.array

  componentDidMount: ->
    $(ReactDOM.findDOMNode(@)).find('.anim-slider').animateSlider(
      autoplay: true
      interval: 5000
      animations:
        0:
          img:
            show: 'bounceInRight'
            hide: 'fadeOutDownBig'
            delayShow: 'delay0s'
          '.box-label':
              show: 'fadeIn'
              hide: 'fadeOut'
              delayShow: 'delay1-5s'
          '.box-label .title':
            show: 'bounceIn'
            hide: 'flipOutX'
            delayShow: 'delay2s'
          '.box-label i':
            show: 'bounceIn'
            hide: 'flipOutX'
            delayShow: 'delay2-5s'
          '.box-label a':
            show: 'bounceIn'
            hide: 'flipOutX'
            delayShow: 'delay2-5s'
        1:
          img:
            show: 'bounceInDown'
            hide: 'flipOutX'
            delayShow: 'delay0s'
          '.box-label':
              show: 'fadeIn'
              hide: 'fadeOut'
              delayShow: 'delay1-5s'
          '.box-label .title':
            show: 'bounceIn'
            hide: 'flipOutX'
            delayShow: 'delay2s'
          '.box-label i':
            show: 'bounceIn'
            hide: 'flipOutX'
            delayShow: 'delay2-5s'
          '.box-label a':
            show: 'bounceIn'
            hide: 'flipOutX'
            delayShow: 'delay2-5s'

    )

  render: ->
    {clickToTop} = @
    sliderComponent = (i, index) =>
      <li className="anim-slide">
        <img src="#{i.url}"/>
        <div className="box-label">
          <div className="title">{i.title}</div>
          <i></i>
          <a href="#">more details</a>
        </div>
      </li>
    <div className="container-latest" style={marginTop: '5px'}>
      <div className="latest-left">
        <div className="box-container-latest-left">
          <div className="box">
            <div className="box-container-text">
              <div className="latest-text">
                Latest
                <div className="feature">/Featured</div>
              </div>
              <div className="hotel-text">Hotels</div>
              <div className="description-text">The Hotel Division continued to show robust growth in 2014, expanding in the Maldives with the acquisition of Six Sensec Laamu</div>
            </div>
            <a href="#">Read More</a>
          </div>
        </div>
      </div>
      <ul className="image-right anim-slider">
        {@props.sliders.map(sliderComponent)}
      </ul>
      <div className="back-top" onClick={clickToTop}></div>
    </div>

  clickToTop: ->
    $("html, body").animate({ scrollTop: 0 }, "slow")

window.LatestHotel = LatestHotel
