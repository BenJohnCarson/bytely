var BytelyApplication = React.createClass({
  
  getInitialState: function() {
    return { urls: [] };
  },
  
  componentDidMount: function() {
    this.getDataFromRails();
  },
  
  getDataFromRails: function() {
    var self = this;
    $.ajax({
      url: '/urls',
      success: function(data) {
        self.setState({ urls: data});
      },
      error: function(xhr, status, error) {
        alert("Can't get fetch URLs: ", error);
      }
    });
  },
  
  handleAdd: function(url) {
    var urls = this.state.urls;
    urls.push(url);
    this.setState({ urls: urls });
  },
  
  render: function() {
    return(
      <div className="container">
        <div className="jumbotron">
          <h1>Bytely</h1>
        </div>
        <div className="row">
          <div className="col-md-4">
            <NewUrlForm handleAdd={this.handleAdd} />
          </div>
        </div>
        <div className="row">
          <div id="stats" className="col-md-5">
          </div>
        </div>
        <div className="row">
          <div className="col-md-6">
            <UrlTable urls={this.state.urls} />
          </div>
        </div>
      </div>
    );
  }
});

