HotelHeader = React.createClass
  componentDidMount: ->

  componentWillReceiveProps: (newProps) ->

  onHoverMenu: (level, name, e) ->
    if $(e.target).closest('li').hasClass('treeview')
      $(e.target).closest('li').find(".sub#{level}").attr({"style":'display: block !important;'})

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
          <li className="treeview">
            <a href="#" onMouseOver={onHoverMenu.bind(@,1, 'about us')}>about us<i></i></a>
            <div className="sub1">
              <div className="sub-container">
                <ul className="nav navbar-nav">
                  <li><a href="#">asdfasdf</a></li>
                  <li><a href="#">asdfasdf</a></li>
                  <li className="treeview">
                    <a href="#" onMouseOver={onHoverMenu.bind(@,2, 'aasdf')}>asdfasdf</a>
                    <div className="sub-container sub2">
                      <div className="sub-container">
                        <ul className="nav navbar-nav">
                          <li><a href="#">asdfasdf</a></li>
                          <li><a href="#">asdfasdf</a></li>
                        </ul>
                      </div>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
          </li>
          <li><a href="#" onMouseOver={onHoverMenu.bind(@,'HPL')}>HPL companies<i></i></a></li>
          <li><a href="#" onMouseOver={onHoverMenu.bind(@,'investor relations')}>investor relations<i></i></a></li>
          <li><a href="#">career</a></li>
        </ul>
      </nav>
    </div>

window.HotelHeader = HotelHeader
