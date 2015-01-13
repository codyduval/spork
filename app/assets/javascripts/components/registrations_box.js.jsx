/** @jsx React.DOM */

var RegistrationsBox = React.createClass({

  render: function () {
    return (
      <div className="well">
        <table className="table">
          <RegistrationsList selectedSession={this.props.selectedSession} kids={this.props.kids} />
        </table>
      </div>
      );
  }
});
