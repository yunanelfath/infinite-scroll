FooterAdx = React.createClass
  PropTypes: {
    footerImage: React.PropTypes.object
  }

  render: ->
    { footerImage } = @props
    { bottomLogo } = footerImage

    <div className="footer-adx">
      <div className="container">
        <div className="row">
          <div className="col-sm-4">
            <div className="logo-footer">
              <a href="index.html"><img src="#{bottomLogo}"/></a>
            </div>
          </div>
          <div className="col-sm-8">
            <div className="menu-bottom">
              <div className="menu-link">
                <a href="">home</a>
                <a href="">screen</a>
                <a href="">learn more</a>
              </div>
              <div className="menu-social">
                <span>Follow Us</span>
                <a className="ml10" href=""><i className="fa fa-instagram"></i></a>
                <a href=""><i className="fa fa-facebook"></i></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
window.FooterAdx = FooterAdx
