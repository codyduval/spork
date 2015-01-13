/** @jsx React.DOM */

var Registration = React.createClass({

  getInitialState: function () {
    return { sessions: this.props.initialSessions,
             user: this.props.user,
             selectedSession: "",
             children: this.props.children };
  },

  render: function () {
    return (
      <div className="row">
        <div className="col-med-8">
          <SessionsBox initialSessions={this.state.sessions} selectedSession{this.state.selectedSession} />
        </div>
        <div className="col-med-8">
          <RegistrationsBox user={this.state.user} />
        </div>
      </div>
      );
  }
});
