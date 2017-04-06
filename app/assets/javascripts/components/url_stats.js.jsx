var UrlStats = React.createClass({

  propTypes: {
    original_url: React.PropTypes.string,
    short_url: React.PropTypes.string,
  },

  render: function() {
    var url = this.props.url;
    return(
      <p>{url.id}</p>
    );
  }
});