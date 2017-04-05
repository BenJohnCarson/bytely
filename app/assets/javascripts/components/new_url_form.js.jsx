var NewUrlForm = React.createClass({
  
  propTypes: {
    original_url: React.PropTypes.node
  },
  
  getInitialState: function() {
    return { original_url: '' };
  },
  
  handleAdd: function(e) {
    e.preventDefault();
    var self = this;
    if (this.validForm()) {
      $.ajax({
        url: '/urls',
        method : 'POST',
        data: { url: self.state },
        success: function(data) {
          self.props.handleAdd(data);
          self.setState(self.getInitialState());
        },
        error: function(xhr, status, error) {
          alert("Couldn't add the URL: ", error);
        }
      })
    } else {
      alert("Please enter a URL");
    }
  },
  
  validForm: function() {
    if (this.state.original_url) {
      return true;
    } else {
      return false;
    }
  },
  
  handleChange: function(e) {
    var input_name = e.target.name;
    var value = e.target.value;
    this.setState({ [input_name] : value});
  },

  render: function() {
    return (
      <form className="form-inline" onSubmit={this.handleAdd}>
        <div className="form-group">
          <input type="text"
                 className="form-control"
                 name="original_url"
                 placeholder="Your URL"
                 ref="original_url"
                 value={this.state.original_url}
                 onChange={this.handleChange} />
        </div>
        <button type="submit" className="btn btn-primary">Add</button>
      </form>
    );
  }
});
