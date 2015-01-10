/** @jsx React.DOM */

var SemesterButton = React.createClass({
  handleFilter: function (e) {
    this.setState({selected: "active"})
    this.props.onFilter(this.props.name);
  },

  getInitialState: function () {
    return {selected: ""};
  },

  render: function() {
    return (
      <li className={this.state.selected}>
        <a onClick={this.handleFilter}>{this.props.name}</a>
      </li>
    );
  }
});


var SessionHeader = React.createClass({
  render: function() {
    return (
      <thead>
        <tr>
          <td><h2>Name</h2></td>
          <td><h2>Start Time</h2></td>
          <td><h2>End Time</h2></td>
          <td><h2>Days of Week</h2></td>
        </tr>
      </thead>
    );
  }
});
