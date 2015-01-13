/** @jsx React.DOM */

var RegistrationsList = React.createClass({
  render: function () {
    return (
      <tbody className="registration-list">
        {this.props.user}
      </tbody>
    );
  }
});
