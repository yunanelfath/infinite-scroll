HeaderSaleStock = React.createClass
  PropTypes: {
    onShowForm: React.PropTypes.func
  }

  onToggleNavbar: ->
    if $(ReactDOM.findDOMNode(this)).find('.navbar-toggle').is(':visible')
      $(ReactDOM.findDOMNode(this)).find('.navbar-toggle').trigger('click')

  onApplicationClick: ->
    @props.onShowForm('application')
    @onToggleNavbar()

  onHomeClick: ->
    @props.onShowForm('home')
    @onToggleNavbar()

  render: ->
    <header className="navbar navbar-default navbar-fixed-top">
      <div className="container">
        <div className="navbar-header">
          <button className="navbar-toggle collapsed" aria-controls="navbar" aria-expanded="false" data-target="#navbar"
            data-toggle="collapse" type="button">
            <span className="sr-only">Toggle navigation</span>
            <span className="icon-bar"></span>
            <span className="icon-bar"></span>
            <span className="icon-bar"></span>
          </button>
          <a className="navbar-brand" href="javascript:void(0)">UX DEVELOPER</a>
        </div>
        <div id="navbar" className="navbar-collapse collapse" style={height: '1px'}>
          <ul className="nav navbar-nav navbar-right">
            <li><a onClick={@onHomeClick} href="javascript:void(0)">HOME</a></li>
            <li><a onClick={@onApplicationClick} href="javascript:void(0)">APPLICATION</a></li>
          </ul>
        </div>
      </div>
    </header>
window.HeaderSaleStock = HeaderSaleStock
