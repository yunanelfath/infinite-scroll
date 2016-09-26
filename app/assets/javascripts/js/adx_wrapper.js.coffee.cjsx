AdxWrapper = React.createClass
  PropTypes: {
    headerImage: React.PropTypes.object
    footerImage: React.PropTypes.object
    contentImage: React.PropTypes.object
    aboutImage: React.PropTypes.object
    sliderImage: React.PropTypes.object
  }
  componentDidMount: ->
    $(ReactDOM.findDOMNode(@)).find('.owl-adx').owlCarousel({ items: 1,loop: true,autoplay: true,autoplayTimeout: 5000,autoplayHoverPause: true,dots: true})

  render: ->
    { sliderImage, headerImage, footerImage, contentImage, aboutImage } = @props
    { adxLogo, signUpLogo } = headerImage
    { bottomLogo } = footerImage
    { middleImage } = contentImage
    { itemImage } = aboutImage
    { first } = sliderImage
    <div className="wrapper-adx">
      <div className="header-adx">
        <div className="container">
          <div className="row">
            <div className="col-sm-4">
              <div className="logo-adx">
                <a href="javascript:void(0)"><img src="#{adxLogo}"/></a>
              </div>
            </div>
            <div className="col-sm-8">
              <div className="menu-top">
                <div className="menu-user">
                  <a href="screen.html">Screen</a>
                  <a href="learn-more.html">Learn More</a>
                </div>
                <div className="menu-action">
                  <a href="signup.html"><img src="#{signUpLogo}" style={marginRight: '15px'}/>Sign Up</a>
                  <a href="login.html" className="login">Log in</a>
                </div>
                <div className="clearfix"></div></div>
            </div>
          </div>
        </div>
      </div>

      <div className="slide-adx">
        <div className="owl-adx">
         <div className="item">
            <img src="#{first}" alt=""/>
            <div className="slide-text">
               <div className="container">
                  <div className="row">
                     <div className="col-sm-12">
                        <div className="slide-wrap">
                           <h2><span>YOUR ADS</span>. Thousand Eyes</h2>
                           <p>
                              Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid magnam, excepturi quisquam labore fugiat maiores tempore recusandae error. Saepe veniam illum suscipit fuga incidunt id esse, nam dicta amet maiores.
                           </p>
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
            <img src="#{first}" alt=""/>
            <div className="slide-text">
               <div className="container">
                  <div className="row">
                     <div className="col-sm-12">
                        <div className="slide-wrap">
                           <h2><span>YOUR ADS</span>. Thousand Eyes</h2>
                           <p>
                              Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid magnam, excepturi quisquam labore fugiat maiores tempore recusandae error. Saepe veniam illum suscipit fuga incidunt id esse, nam dicta amet maiores.
                           </p>
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

      <div className="intro-adx">
        <div className="container">
         <div className="row">
          <div className="col-sm-12">
           <p className="text-center">
              Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto repellendus totam assumenda, laborum eligendi, porro at voluptates consectetur quibusdam sequi facilis numquam tenetur, consequuntur! Delectus necessitatibus et doloremque non vitae.
           </p>
          </div>
         </div>
        </div>
      </div>

      <div className="about-adx">
        <div className="container">
          <div className="col-sm-4">
            <div className="about-box">
              <img src="#{itemImage}"/>
              <div className="box-meta">
                <h3>1</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
              </div>
            </div>
          </div>
          <div className="col-sm-4">
            <div className="about-box">
              <img src="#{itemImage}"/>
              <div className="box-meta">
                <h3>1</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
              </div>
            </div>
          </div>
          <div className="col-sm-4">
            <div className="about-box">
              <img src="#{itemImage}"/>
              <div className="box-meta">
                <h3>1</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
              </div>
            </div>
          </div>
        </div>
      </div>


      <div className="featured-screen wrapper-box">
        <div className="container">
          <div className="row">
            <div className="col-xs-12">
              <h2 className="featured-text-title text-center">featured screen</h2>
            </div>
            <div className="clearfix"></div>
            <div>
              <div className="col-sm-4">
                <div className="box-screen">
                  <div className="box-img">
                     <a href="screen-detail.html">
                        <img alt="" src="#{middleImage}"/>
                     </a>
                  </div>
                  <div className="box-property">
                     <h3 className="box-title">
                        <a href="screen-detail.html">
                           Lorem ipsum dolor si amet lay nsd
                        </a>
                     </h3>

                     <div className="capacity">
                        <span><img alt="" src={"img/icon/employees.png"}/> 200-2000 <span className="people-day">people/day</span></span>
                     </div>
                     <div className="feature">
                        <span><img alt="" src="img/icon/television.png"/> Landscap Monitor</span>
                     </div>
                     <div className="clearfix"></div>

                  </div>
                  <div className="box-value">
                     <span>
                        Lippo Mall Puri Jakarta
                     </span>
                     <span>
                        Cafe
                     </span>
                     <span>
                        Avg Spending Rp. 50.000/person
                     </span>
                     <span>
                        Price Rp.20.000 - Rp.100.000
                     </span>
                  </div>
               </div>
              </div>
              <div className="col-sm-4">
                <div className="box-screen">
                  <div className="box-img">
                     <a href="screen-detail.html">
                        <img alt="" src="#{middleImage}"/>
                     </a>
                  </div>
                  <div className="box-property">
                     <h3 className="box-title">
                        <a href="screen-detail.html">
                           Lorem ipsum dolor si amet lay nsd
                        </a>
                     </h3>

                     <div className="capacity">
                        <span><img alt="" src="img/icon/employees.png"/> 200-2000 <span className="people-day">people/day</span></span>
                     </div>
                     <div className="feature">
                        <span><img alt="" src="img/icon/television.png"/> Landscap Monitor</span>
                     </div>
                     <div className="clearfix"></div>

                  </div>
                  <div className="box-value">
                     <span>
                        Lippo Mall Puri Jakarta
                     </span>
                     <span>
                        Cafe
                     </span>
                     <span>
                        Avg Spending Rp. 50.000/person
                     </span>
                     <span>
                        Price Rp.20.000 - Rp.100.000
                     </span>
                  </div>
               </div>
              </div>
              <div className="col-sm-4">
                <div className="box-screen">
                  <div className="box-img">
                     <a href="screen-detail.html">
                        <img alt="" src="#{middleImage}"/>
                     </a>
                  </div>
                  <div className="box-property">
                     <h3 className="box-title">
                        <a href="screen-detail.html">
                           Lorem ipsum dolor si amet lay nsd
                        </a>
                     </h3>

                     <div className="capacity">
                        <span><img alt="" src={"img/icon/employees.png"}/> 200-2000 <span className="people-day">people/day</span></span>
                     </div>
                     <div className="feature">
                        <span><img alt="" src="img/icon/television.png"/> Landscap Monitor</span>
                     </div>
                     <div className="clearfix"></div>

                  </div>
                  <div className="box-value">
                     <span>
                        Lippo Mall Puri Jakarta
                     </span>
                     <span>
                        Cafe
                     </span>
                     <span>
                        Avg Spending Rp. 50.000/person
                     </span>
                     <span>
                        Price Rp.20.000 - Rp.100.000
                     </span>
                  </div>
               </div>
              </div>
            </div>
            <div className="col-xs-12">
              <a className="btn btn-more" href="screen.html">see more</a>
            </div>
          </div>
        </div>
      </div>

      <div className="content-screen">
        <div className="container">
           <div className="row">
              <div className="col-sm-12">
                 <div className="account-container">
                    <h2 className="title-account">Login to your account</h2>
                    <form action="login-success.html" className="form-horizontal">
                       <div className="form-group">
                          <label className="col-sm-5 control-label" for="email">Email <span>:</span></label>
                          <div className="col-sm-7">
                             <input type="email" placeholder="Your Email Account" id="email" className="form-control"/>
                          </div>
                       </div>
                       <div className="form-group">
                          <label className="col-sm-5 control-label" for="password">Password <span>:</span></label>
                          <div className="col-sm-7">
                             <input type="password" placeholder="Your Password" id="password" className="form-control"/>
                          </div>
                       </div>

                       <div className="form-group">
                          <div className="col-sm-12">
                             <div className="text-center mtb40">
                                <input type="submit" className="btn btn-submit" value="LOGIN"/>
                             </div>
                          </div>
                       </div>
                    </form>
                    <div className="line-login mb40"></div>
                    <p className="has-account">
                       <a href="">Forgot Password? Click here!</a>
                       <br/>
                       <br/>
                       Have no account? <a href="signup.html">Sign up here</a>
                    </p>
                 </div>
              </div>
           </div>
        </div>
      </div>



      <div className="content-screen">
        <div className="container">
           <div className="row">
              <div className="col-sm-12">
                 <div className="account-container">
                    <h2 className="title-account">Sign up and start posting your ad in our screens</h2>
                    <form action="signup-success.html" className="form-horizontal">
                       <div className="form-group">
                          <label className="col-sm-5 control-label" for="email">Email <span>:</span></label>
                          <div className="col-sm-7">
                             <input type="email" placeholder="Your Email Account" id="email" className="form-control"/>
                          </div>
                       </div>
                       <div className="form-group">
                          <label className="col-sm-5 control-label" for="password">Password <span>:</span></label>
                          <div className="col-sm-7">
                             <input type="password" placeholder="Your Password" id="password" className="form-control"/>
                          </div>
                       </div>
                       <div className="form-group">
                          <label className="col-sm-5 control-label" for="repassword">Retype Password <span>:</span></label>
                          <div className="col-sm-7">
                             <input type="password" placeholder="Your Password" id="repassword" className="form-control"/>
                          </div>
                       </div>
                       <div className="form-group">
                          <div className="col-sm-12">
                             <div className="text-center mtb40">
                                <input type="submit" className="btn btn-submit" value="SIGNUP"/>
                             </div>
                          </div>
                       </div>
                    </form>
                    <div className="line-login mb40"></div>
                    <p className="has-account">
                       Already sign up? <a href="login.html">Log In here!</a>
                    </p>
                 </div>
              </div>
           </div>
        </div>
      </div>

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
    </div>

window.AdxWrapper = AdxWrapper
