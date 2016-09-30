About = React.createClass
  PropTypes: {
    aboutImages: React.PropTypes.array
  }

  render: ->
    { aboutImages } = @props
    i = 0
    aboutRowComponent = (data, index) ->
      <AboutRowComponent data={data} key={i++} idx={i}/>

    <div className="about-adx">
      <div className="container">
        {aboutImages.map(aboutRowComponent)}
      </div>
    </div>

AboutRowComponent = React.createClass
  PropTypes: {
    data: React.PropTypes.object
    idx: React.PropTypes.number
  }
  render: ->
    {data, idx} = @props


    <div className="col-sm-4">
      <div className="about-box">
        <img src={data.image}/>
        <div className="box-meta">
          <h3>{idx}</h3>
          <p>{data.title}</p>
        </div>
      </div>
    </div>

window.About = About
