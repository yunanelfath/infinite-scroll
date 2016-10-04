ContentSaleStock = React.createClass
  PropTypes: {
    onShowForm: React.PropTypes.func
  }

  onApplicationClick: ->
    @props.onShowForm('application')

  onAboutMeClick: ->
    @props.onShowForm('about me')

  render: ->
    <div className="container">
      <div className="jumbotron">
        <h1>Application Form</h1>
        <p>To see the difference between static and fixed top navbars, just scroll.</p>
        <p>
          <a onClick={@onApplicationClick} role="button" href="javascript:void(0)" className="btn btn-lg btn-primary">Application Form »</a>
        </p>
      </div>
      <div className="jumbotron">
        <h1>About me</h1>
        <p>To see the difference between static and fixed top navbars, just scroll.</p>
        <p>
          <a onClick={@onAboutMeClick} role="button" href="javascript:void(0)" className="btn btn-lg btn-primary">Application Form »</a>
        </p>
      </div>
    </div>
window.ContentSaleStock = ContentSaleStock
