AdsPaymentForm = React.createClass
  PropTypes: {
    onChangeInputFile: React.PropTypes.func
  }

  getInitialState: ->
    {
      deviceDetailContent: AdxWrapperStore.deviceDetailContent
    }

  componentDidMount: ->
    @listener = AdxWrapperStore.addChangeListener(@_onChange)
    @setAjaxFormSubmit()

  componentWillUnmount: ->
    @listener.remove()

  _onChange: ->
    @setState(deviceDetailContent: AdxWrapperStore.deviceDetailContent)

  adsPaymentForm: ->
    <div className="container">
      <div className="row">
        <div className="col-sm-12">
          <div className="ad-payment-table">
            <div className="payment-cell">
              <h3>Payment Detail</h3>
              <div className="box-payment">
                <div className="row">
                  <div className="col-sm-5 col-xs-6">Date(s) for your ad</div>
                  <div className="col-sm-7 col-xs-6">1 September 2016 - 10 September 2016</div>
                </div>
                <div className="mb40"></div>
                <div className="row">
                  <div className="col-sm-5 col-xs-6">Days available</div>
                  <div className="col-sm-7 col-xs-6">10 day(s)</div>
                </div>
                <div className="mb40"></div>
                <div className="row">
                  <div className="col-sm-5 col-xs-6">Date(s) not available </div>
                  <div className="col-sm-7 col-xs-6">11 September 2016 - 12 September 2016</div>
                </div>
                <div className="mb40"></div>
                <div className="row">
                  <div className="col-sm-5 col-xs-6">
                     Investment/day
                  </div>
                  <div className="col-sm-7 col-xs-6">
                     Rp. 25.000/day
                  </div>
                </div>
                <div className="line-1px"></div>
                <div className="row">
                  <div className="col-sm-5 col-xs-6">
                     TOTAL PAYMENT
                  </div>
                  <div className="col-sm-7 col-xs-6">
                     Rp. 250.000
                  </div>
                </div>
              </div>
            </div>
            <div className="arrow-cell"><i className="fa fa-angle-right"></i></div>
            <div className="ad-cell">
              <h3>Upload Your Ad</h3>
              <div className="ad-detail">
                <div className="upload-container">
                  <label className="btn btn-upload uploadad" title="UPLOAD">
                    <input type="file"
                      onChange={@props.onChangeInputFile}
                      className="hide" id="uploadad" name="image_raw" accept="image/*"/>UPLOAD
                  </label>
                  <input type="submit" value="SEND" className="hide" id="send-ad"/>
                </div>
                <p className="text-center mtb10"><small>Size : 1920 x 1080 pixels</small></p>
                <div className="ad-display"><img src="http://placehold.it/350x220/843c0c/ffffff?text=Your+Ad"/></div>
                <p className="text-center font-bold mtb10">Your Ad</p>
              </div>
            </div>
          </div>
          <div className="text-center mtb30">
            <input type="submit" className="btn btn-submit" value="CONTINUE TO PAYMENT"/>
          </div>
        </div>
      </div>
    </div>

  setAjaxFormSubmit: (event) ->
    token = getCookie('___adxLoginToken')
    $(ReactDOM.findDOMNode(@)).find('#js-form-ad').ajaxForm(
      headers: {"Authorization": JSON.parse(token).token}
      beforeSubmit: (arr, form, options)->
      success: (data) ->
        sweetAlert("Congratulations","Your request has been sent.","success")
        Turbolinks.visit('/')
      error: (a, i) ->
        sweetAlert("Fail","Something wrong!","error")
    )

  render: ->
    { startDate, endDate, pub_id } = @state.deviceDetailContent

    adsPaymentForm = @adsPaymentForm()
    <div className="ads-payment">
      <form
          data-remote={true}
          encType="multipart/form-data"
          id="js-form-ad"
          method="POST"
          action="https://sandbox.10adx.com/advertisement/api/schedule/new/">
        <input type="hidden" name='device' value={pub_id}/>
        <input type="hidden" name='start' value={startDate}/>
        <input type="hidden" name='end' value={endDate}/>
        {adsPaymentForm}
      </form>
    </div>

window.AdsPaymentForm = AdsPaymentForm
