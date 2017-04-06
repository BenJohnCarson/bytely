var UrlTable = React.createClass({

  render: function() {
    
    var urls = [];
    this.props.urls.forEach(function(url) {
      urls.push(<Url  url={url}
                      key={'url' + url.id}/>);
    }.bind(this));
    
    return(
      <table className="table table-striped">
        <thead>
          <tr>
            <th className="col-md-1">Original Url</th>
            <th className="col-md-2">Short Url</th>
            <th className="col-md-3"></th>
          </tr>
        </thead>
        <tbody>
          {urls}
        </tbody>
      </table>
    );
  }
});
