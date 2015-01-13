/** @jsx React.DOM */

var SessionList = React.createClass({

  handleSelect: function (e) {
    this.props.onSelect(e);
  },

  render: function () {
    var sessionNodes = this.props.sessions.map(function (session, index) {
      return (
        <Session name={session.name} start_time={session.start_time} end_time={session.end_time} days_of_week={session.days_of_week} key={index} onSelect={this.handleSelect} selectedSession={this.props.selectedSession} />
        );
    }.bind(this));

    return (
      <tbody className="session-list">
        {sessionNodes}
      </tbody>
    );
  }
});
