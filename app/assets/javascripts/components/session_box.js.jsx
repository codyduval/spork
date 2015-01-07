/** @jsx React.DOM */

var SessionsBox = React.createClass({
  getInitialState: function () {
    return {sessions: []};
  },
  componentDidMount: function () {
    this.loadSessionsFromServer();
  },
  loadSessionsFromServer: function () {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      success: function (sessions) {
        this.setState({sessions: sessions});
      }.bind(this),
      error: function (xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
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
