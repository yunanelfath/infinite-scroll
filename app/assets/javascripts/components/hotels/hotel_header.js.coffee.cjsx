HotelHeader = React.createClass
  componentDidMount: ->

  componentWillReceiveProps: (newProps) ->

  onHoverMenu: (event, e) ->
    console.log event

  render: ->
    { onHoverMenu } = @
    <div className="container" style={marginTop: '5px'}>
      <nav>
        <div className="nav navbar-nav navbar-left">
          <div>
            <a className="logo-hotel display-table-column" href="#" style={padding: 0}></a>
            <a className="display-table-column" href="#">hotel properties limited</a>
          </div>
        </div>
      </nav>
      <nav>
        <ul className="nav navbar-nav navbar-right">
          <li><a href="#" onMouseOver={onHoverMenu.bind(@,'about us')}>about us<i></i></a></li>
          <li><a href="#" onMouseOver={onHoverMenu.bind(@,'HPL')}>HPL companies<i></i></a></li>
          <li><a href="#" onMouseOver={onHoverMenu.bind(@,'investor relations')}>investor relations<i></i></a></li>
          <li><a href="#">career</a></li>
        </ul>
      </nav>
    </div>

window.HotelHeader = HotelHeader
