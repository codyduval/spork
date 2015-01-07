/** @jsx React.DOM */

var SessionsBox = React.createClass({
  getInitialState: function () {
    return {sessions: this.props.initialSessions};
  },
  render: function () {
    return (
      <div>
        <SemesterFilter />
        <table className="table">
          <SessionHeader />
          <SessionList sessions={this.state.sessions} />
        </table>
      </div>
      );
  }
});
