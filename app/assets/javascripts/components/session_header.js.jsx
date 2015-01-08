/** @jsx React.DOM */

var SemesterFilter = React.createClass({
  render: function() {
    return (
      <ul className="nav nav-pills">
        <SemesterButton/>
        <SemesterButton/>
      </ul>
    );
  }
});

var SemesterButton = React.createClass({
  render: function() {
    return (
      <li className="active">
        <a>Fall/Winter 2014</a>
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
