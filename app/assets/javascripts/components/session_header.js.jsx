/** @jsx React.DOM */

var SemesterFilter = React.createClass({
  render: function() {
    var names = []
    var semesterNames = this.props.sessions.map(function (session, index) {
      if (names.indexOf(session.semester) < 0 ) { 
        names.push(session.semester);
        return (
          <SemesterButton name={session.semester} key={index} />
          );
      }
    });
    return (
      <ul className="nav nav-pills">
        {semesterNames}
      </ul>
    );
  }
});

var SemesterButton = React.createClass({
  getInitialState: function () {
    return {selected: ""};
  },
  render: function() {
    return (
      <li className={this.state.selected}>
        <a>{this.props.name}</a>
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
