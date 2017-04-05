var Url = React.createClass({

  propTypes: {
    original_url: React.PropTypes.string,
    short_url: React.PropTypes.string,
  },
  
  render: function() {
    var url = this.props.url;
    return(
      <tr>
        <td>{url.original_url}</td>
        <td>{url.short_url}</td>
      </tr>
    )
  }
});
