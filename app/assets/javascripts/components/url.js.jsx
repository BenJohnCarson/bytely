var Url = React.createClass({

  propTypes: {
    original_url: React.PropTypes.string,
    short_url: React.PropTypes.string,
  },
  
  statsButton: function(url) {
    function handleClick(e) {
      e.preventDefault();
      ReactDOM.render( <UrlStats url={url}
                                 key={'url' + url.id}/>, document.getElementById("stats"));
    }
    
    return (
     <a id={"short_url_" + url.id} className="btn btn-primary" href="#" onClick={handleClick}>Stats</a>
      );
  },
  
  render: function() {
    var url = this.props.url;
    return(
      <tr>
        <td>
          <a href={url.original_url}>{url.original_url}</a>
        </td>
        <td>
          <a id={"short_url_" + url.short_code} href={url.short_url}>{url.short_url}</a>
        </td>
        <td>
          {this.statsButton(url)}
        </td>
      </tr>
    );
  }
});
