var Url = React.createClass({

  propTypes: {
    original_url: React.PropTypes.string,
    short_url: React.PropTypes.string,
  },
  
  render: function() {
    var url = this.props.url;
    return(
      <tr>
        <td>
          <a href={url.original_url}>{url.original_url}</a>
        </td>
        <td>
          <a href={url.short_url}>{url.short_url}</a>
        </td>
      </tr>
    )
  }
});
