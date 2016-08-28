HotelHeader = React.createClass
  componentDidMount: ->

  componentWillReceiveProps: (newProps) ->

  render: ->
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
          <li><a href="#">about us<i></i></a></li>
          <li><a href="#">HPL companies<i></i></a></li>
          <li><a href="#">investor relations<i></i></a></li>
          <li><a href="#">career</a></li>
        </ul>
      </nav>
    </div>

window.HotelHeader = HotelHeader
