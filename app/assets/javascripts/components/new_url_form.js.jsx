var NewUrlForm = React.createClass({
  
  propTypes: {
    original_url: React.PropTypes.node
  },
  
  getInitialState: function() {
    return { original_url: '' };
  },
  
  handleAdd: function(e) {
    
  },
  
  validForm: function() {
    
  },
  
  handleChange: function(e) {
    
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
