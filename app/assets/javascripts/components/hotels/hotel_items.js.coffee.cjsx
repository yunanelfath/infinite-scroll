HotelItems = React.createClass
  PropTypes:
    items: React.PropTypes.array

  render: ->
    liComponent = (g, h) =>
      <li>{g}</li>

    rowComponent = (e, f) =>
      <div className="col-item #{e.class.col}" style={background: "url(#{e.background})"}>
        <span>{e.country}</span>
        <div className="hover-box"></div>
        <div className="#{e.class.hover}">
          <div className="label">
            {
              if e.country == 'czech republic'
                'czech'
              else
                e.country
            }
          </div>
          <ul className="hotel-lists">
            <div className="hote-lists-item">
              {e.lists.map(liComponent)}
            </div>
          </ul>
        </div>
      </div>

    columnComponent = (i, k) =>
      <div className="col-half">
        <div className="col-margin">
          {i.map(rowComponent)}
        </div>
      </div>

    <div className="container-hotels-box">
      {@props.items.map(columnComponent)}
    </div>

window.HotelItems = HotelItems
