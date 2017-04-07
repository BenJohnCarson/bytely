var UrlStats = React.createClass({

  propTypes: {
    original_url: React.PropTypes.string,
    short_url: React.PropTypes.string,
  },

  render: function() {
    var url = this.props.url;
    return(
      <div id="stats-table-container">
        <h3>Stats for {url.short_url}</h3>
        <table className="table table-bordered" id="stats-table">
          <thead>
            <tr>
              <th className="col-md-3">Date of last visit</th>
              <th className="col-md-4">Total visits</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td className="stats-data">
                <p>{url.date_last_visit}</p>
              </td>
              <td className="stats-data">
                <p>{url.visits}</p>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    );
  }
});