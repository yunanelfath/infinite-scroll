DateAvailablelityForm = React.createClass
  PropTypes: {
    onChangeEndDate: React.PropTypes.func
    onChangeStartDate: React.PropTypes.func
    onDidChangeEndDate: React.PropTypes.func
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
    @setState(
      deviceDetailContent: AdxWrapperStore.deviceDetailContent
      isLoggedIn: AdxWrapperStore.isLoggedIn
    )

  onChangeEndDate: (event)->
    if @state.deviceDetailContent?.endDate != event.target.value
      @props.onChangeEndDate?(event)

      getUnavailableDate = _.debounce((event) =>
        startDate = new Date(@state.deviceDetailContent.startDate)
        endDate = new Date(@state.deviceDetailContent.endDate)

        if startDate > endDate
          sweetAlert("Fail","You entered invalid date!","error")
        else
          dateMonth = endDate.getMonth() + 1
          dateMonth = dateMonth.toString()
          dateYear = endDate.getUTCFullYear().toString()
          if dateMonth.length == 1
            dateMonth = "0#{dateMonth}"
          pubUrl = "http://sandbox.10adx.com/api/device/"+@state.deviceDetailContent.pub_id+"/unavailable-dates/"+dateMonth+"/"+dateYear+"/?"+$.param({format: 'json'})
          $.ajax
            url: pubUrl
            method: "GET"
            headers: {
              "Authorization": @state.isLoggedIn.token
            }
            success: (data) =>
              arrUnavailableDates = []
              if data.length > 0
                _.map(data, (e)=>
                  tmpStartDate = new Date(e.start)
                  tmpEndDate = new Date(e.end)
                  while tmpStartDate <= tmpEndDate
                    tmpCurrentDate = tmpStartDate.getTime()
                    arrUnavailableDates.push(tmpCurrentDate)
                    tmpStartDate.setDate(tmpStartDate.getDate() + 1)
                )
              arrAvailableDates = []
              while startDate <= endDate
                currentDate = startDate.getTime()
                if $.inArray(currentDate, arrUnavailableDates) < 0
                  arrAvailableDates.push(currentDate)
                startDate.setDate(startDate.getDate() + 1)

              @props.onDidChangeEndDate?(availableDates: arrAvailableDates, unAvailableDates: arrUnavailableDates)


            error: (jqXHR, error) =>
              sweetAlert("Fail","Something wrong!","error")
      ,800)
      getUnavailableDate(event)

  onChangeStartDate: (event)->
    @props.onChangeStartDate?(event)

  render: ->
    { deviceDetailContent } = @state
    { location, description, size, height, width, rotation, price, property_type, address,
      country, province, city, zipcode, audience_daily, average_spending,
      dateStart, dateEnd,
      audience_description, frequently_per_hour, imageLists} = deviceDetailContent

    if _.isEmpty(deviceDetailContent)
      <div className="row"></div>
    else
      setTimeout(=>
        $(ReactDOM.findDOMNode(@)).find('#startDate').datepicker(format: 'yyyy-mm-dd').on('hide', (e) =>
          @onChangeStartDate(e)
        )
        $(ReactDOM.findDOMNode(@)).find('#endDate').datepicker(format: 'yyyy-mm-dd').on('hide', (e) =>
          @onChangeEndDate(e)
        )
      ,800)

      <div className="page-availability">
        <div className="container" ref="dateAvailableForm">
          <div className="row">
            <div className="col-sm-12">
              <div className="page-av-table">
                <div className="page-av-left">
                  <p className="p-relative">Pick start and end date for your ad:</p>
                </div>
                <div className="page-av-right">
                  <div className="form-group">
                    <label>START DATE</label>
                    <div className="has-input has-icon has-calendar">
                      <input type="text" className="form-control" id="startDate" placeholder="Pick Date"/>
                    </div>
                  </div>
                  <div className="form-group">
                    <label>END DATE</label>
                    <div className="has-input has-icon has-calendar">
                      <input type="text" className="form-control" id="endDate" placeholder="Pick Date"/>
                    </div>
                  </div>
                </div>
              </div>
              {
                if deviceDetailContent?.unAvailableDates
                  if deviceDetailContent?.unAvailableDates.length > 0
                    choosenDateStart = new Date(deviceDetailContent?.startDate)
                    choosenDateEnd = new Date(deviceDetailContent?.endDate)
                    <div className="page-av-table">
                      <div className="page-av-left">
                        <p>There are unavailable date(s) based on your choice</p>
                      </div>
                      <div className="page-av-right">
                        <span className="date-availability">{choosenDateStart.toDateString()}</span>
                        <span className="date-availability">{choosenDateEnd.toDateString()}</span>
                      </div>
                    </div>
                  else
                    <div className="page-av-table">
                      <div className="page-av-left text-center">
                        <p>All Dates are available</p>
                      </div>
                    </div>
              }
            </div>
          </div>
        </div>
      </div>

window.DateAvailablelityForm = DateAvailablelityForm
