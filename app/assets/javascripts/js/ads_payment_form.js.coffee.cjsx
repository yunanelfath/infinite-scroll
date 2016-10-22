toCurrencyRp = (num) ->
  return 'Rp. 0.0' if num == null || num == undefined
  num = Number(Math.round(num + 'e2') + 'e-2')
  "#{num.toLocaleString('en-US')}"

AdsPaymentForm = React.createClass
  PropTypes: {
    onChangeInputFile: React.PropTypes.func
  }

  getInitialState: ->
    {
      deviceDetailContent: AdxWrapperStore.deviceDetailContent
      isLoggedIn: AdxWrapperStore.isLoggedIn
    }

  componentDidMount: ->
    @listener = AdxWrapperStore.addChangeListener(@_onChange)

  componentWillUnmount: ->
    @listener.remove()

  _onChange: ->
    @setState(deviceDetailContent: AdxWrapperStore.deviceDetailContent, isLoggedIn: AdxWrapperStore.isLoggedIn)

  adsPaymentForm: ->
    { deviceDetailContent } = @state
    { startDate, endDate, price, availableDates, unAvailableDates } = deviceDetailContent

    maxDate = Math.max.apply(Math, availableDates)
    minDate = Math.min.apply(Math, availableDates)

    max2Date = Math.max.apply(Math, unAvailableDates)
    min2Date = Math.min.apply(Math, unAvailableDates)

    <div className="container">
      <div className="row">
        <div className="col-sm-12">
          <div className="ad-payment-table">
            <div className="payment-cell">
              <h3>Payment Detail</h3>
              <div className="box-payment">
                <div className="row">
                  <div className="col-sm-5 col-xs-6">Date(s) for your ad</div>
                  <div className="col-sm-7 col-xs-6">{new Date(minDate).toDateString()} - {new Date(maxDate).toDateString()}</div>
                </div>
                <div className="mb40"></div>
                <div className="row">
                  <div className="col-sm-5 col-xs-6">Days available</div>
                  <div className="col-sm-7 col-xs-6">{availableDates.length}&nbsp;day(s)</div>
                </div>
                <div className="mb40"></div>
                <div className="row">
                  <div className="col-sm-5 col-xs-6">Date(s) not available </div>
                  <div className="col-sm-7 col-xs-6">{new Date(min2Date).toDateString()} - {new Date(max2Date).toDateString()}</div>
                </div>
                <div className="mb40"></div>
                <div className="row">
                  <div className="col-sm-5 col-xs-6">
                     Investment/day
                  </div>
                  <div className="col-sm-7 col-xs-6">
                     Rp. {toCurrencyRp(price)}/day
                  </div>
                </div>
                <div className="line-1px"></div>
                <div className="row">
                  <div className="col-sm-5 col-xs-6">
                     TOTAL PAYMENT
                  </div>
                  <div className="col-sm-7 col-xs-6">
                     Rp. {toCurrencyRp(availableDates.length * price)}
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
                <p className="text-center mtb10" id="target-size"><small></small></p>
                <div className="ad-display">
                  <div id="jcrop-target" style={background: 'url(http://placehold.it/350x220/843c0c/ffffff?text=Your+Ad)', height: '100%'}></div>
                </div>
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

  setAjaxFormSubmit: (event)->
    token = getCookie('___adxLoginToken')

    event.preventDefault()
    event.stopPropagation()
    if token
      $(ReactDOM.findDOMNode(@)).find('#js-form-ad').ajaxSubmit(
        headers: {"Authorization": JSON.parse(token).token}
        beforeSubmit: (arrs, form, options)->
          allowedRequired = ['image_raw', 'start','end']
          arrValidate = []
          for arr in arrs
            if $.inArray(arr.name, allowedRequired) >= 0 && arr.value == ""
              field = if $.inArray(arr.name, ["start", "end"]) >= 0 then "#{arr.name} date" else "Image File"
              arrValidate.push("#{field} Can't be Blank!")
          if arrValidate.length > 0
            sweetAlert("Fail","#{arrValidate.join(', ')}","error")
            return false
        success: (data) ->
          swal(
            {
              title: 'Congratulations'
              text: 'Your request has been sent.'
              type: 'success'
            }
            (e) ->
              eraseCookie('___adxDetailIdToken')
              setTimeout(=>
                window.location.href = if window.location.href.match(".html") == null then "/" else "index.html"
              ,800)
          )
        error: (a, i) ->
          arrValidate = []
          if a.status == 400
            arrValidate = _.map(a.responseJSON, (e, i)-> "#{if i != 0 then i.toString().toUpperCase() else ''} #{e}")
          else
            arrValidate.push('Something wrong!')
          sweetAlert("Fail","#{arrValidate.join(',')}","error")
      )

  render: ->
    { isLoggedIn, deviceDetailContent } = @state
    { startDate, endDate, pub_id } = deviceDetailContent

    <div className="ads-payment">
      {
        if isLoggedIn?.status
          if deviceDetailContent?.availableDates
            adsPaymentForm = @adsPaymentForm()
            <form
                data-remote={true}
                encType="multipart/form-data"
                id="js-form-ad"
                method="POST"
                onSubmit={@setAjaxFormSubmit}
                action="http://sandbox.10adx.com/advertisement/api/schedule/new/">
              <input type="hidden" name='device' value={pub_id}/>
              <input type="hidden" name='start' value={startDate}/>
              <input type="hidden" name='end' value={endDate}/>
              {adsPaymentForm}
            </form>
          else
            <div></div>
        else
          <div className="account-container">
            <h2 className="title-account">You have to login your account</h2>
            <p className="note-account">
              <a href="#{if window.location.href.match('.html') == null then '/sign-in' else 'sign-in.html'}">Click here to return Login</a>
            </p>
          </div>
      }
    </div>

window.AdsPaymentForm = AdsPaymentForm
