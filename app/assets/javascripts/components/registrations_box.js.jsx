/** @jsx React.DOM */

var RegistrationsBox = React.createClass({

  getInitialState: function () {
    return { sessions: this.props.initialSessions,
             user: this.props.user,
             registrations: [],
             kids: this.props.kids };
  },

  render: function () {
    return (
      <div>
        <table className="table">
          <RegistrationsList registrations={this.state.registrations} />
        </table>
      </div>
      );
  }
});
