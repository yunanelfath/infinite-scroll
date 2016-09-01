HotelHeader = React.createClass
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
          <li className="treeview">
            <a href="#">about us<i></i></a>
            <ul className="nav navbar-nav sub">
              <li><a href="#">corporate information</a></li>
              <li><a href="#">corporate profile</a></li>
              <li><a href="#">board of directors</a></li>
            </ul>
          </li>
          <li className="treeview">
            <a href="#">HPL companies<i></i></a>
            <ul className="nav navbar-nav sub">
              <li><a href="#">hotels</a></li>
              <li><a href="#">properties</a></li>
              <li><a href="#">lifestyle</a></li>
            </ul>
          </li>

          <li className="treeview">
            <a href="#">investor relations<i></i></a>
            <ul className="nav navbar-nav sub">
              <li className="treeview">
                <a href="#">annual reports<i></i></a>
                <ul className="nav navbar-nav sub2">
                  <li><a href="#">latest</a><i></i></li>
                  <li><a href="#">archive</a></li>
                </ul>
              </li>
              <li><a href="#">financial reports</a></li>
              <li ><a href="#">dividen history</a></li>
              <li className="treeview">
                <a href="#">latest news<i></i></a>
                <ul className="nav navbar-nav sub2">
                  <li><a href="#">latest</a></li>
                  <li><a href="#">archive</a></li>
                </ul>
              </li>
            </ul>
          </li>
          <li><a href="#">career</a></li>
        </ul>
      </nav>
    </div>

window.HotelHeader = HotelHeader
