DateAvailablelityForm = React.createClass
  PropTypes: {
    onChangeEndDate: React.PropTypes.func
    onChangeStartDate: React.PropTypes.func
  }
  getInitialState: ->
    {
      deviceDetailContent: AdxWrapperStore.deviceDetailContent
    }

  componentDidMount: ->
    @listener = AdxWrapperStore.addChangeListener(@_onChange)

  componentWillUnmount: ->
    @listener.remove()

  _onChange: ->
    @setState(deviceDetailContent: AdxWrapperStore.deviceDetailContent)

  onChangeEndDate: (event)->
    @props.onChangeEndDate?(event)

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
      _this = @
      setTimeout(=>
        $(ReactDOM.findDOMNode(@)).find('#startDate').datepicker(format: 'yyyy-mm-dd').on('hide', (e) =>
          _this.onChangeStartDate(e)
        )
        $(ReactDOM.findDOMNode(@)).find('#endDate').datepicker(format: 'yyyy-mm-dd').on('hide', (e) =>
          _this.onChangeEndDate(e)
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
              <div className="page-av-table">
                <div className="page-av-left">
                  <p>There are unavailable date(s) based on your choice</p>
                </div>
                <div className="page-av-right">
                  <span className="date-availability">20 November 2016</span>
                  <span className="date-availability">20 November 2016</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

window.DateAvailablelityForm = DateAvailablelityForm
