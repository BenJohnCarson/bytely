var BytelyApplication = React.createClass({
 render: function() {
    return(
      <div className="container">
        <div className="jumbotron">
          <h1>Bytely</h1>
          <p>by Ben Carson</p>
        </div>
        <div className="row">
          <div className="col-md-4">
            <NewUrlForm />
          </div>
        </div>
      </div>
    );
  }
});

