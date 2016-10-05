{ Button, FormGroup, FormControl, Col, Row } = ReactBootstrap

ApplicationSaleStock = React.createClass
  render: ->
    <div className="container">
      <div className="jumbotron" style={paddingTop: '10px'}>
        <legend>Data Sista</legend>
        <div className="bs-example">
          <FormGroup>
            <label className="control-label">Nama Sista*</label>
            <FormControl value={null} placeholder="Nama sista"/>
          </FormGroup>
          <FormGroup>
            <label className="control-label">Email Sista*</label>
            <FormControl value={null} placeholder="Email sista"/>
          </FormGroup>
          <FormGroup>
            <label className="control-label">Handphone Sista*</label>
            <FormControl value={null} placeholder="Handphone sista"/>
          </FormGroup>
        </div>
      </div>
      <div className="navbar navbar-default navbar-fixed-bottom">
        <div className="container" style={paddingTop: '8px'}>
          <Button className="btn btn-primary pull-left">« Back</Button>
          <Button className="btn btn-success pull-right">Next »</Button>
        </div>
      </div>
    </div>
window.ApplicationSaleStock = ApplicationSaleStock
