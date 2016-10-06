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
        <h1>Retur Form</h1>
        <p>Input your retur request to us with fill this form below.</p>
        <p>
          <a onClick={@onApplicationClick} role="button" href="javascript:void(0)" className="btn btn-lg btn-primary">Application Form »</a>
        </p>
      </div>
    </div>
window.ContentSaleStock = ContentSaleStock
