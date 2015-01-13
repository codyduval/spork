/** @jsx React.DOM */

var Registration = React.createClass({

  handleSelect: function(sessionName) {
    this.setState({ selectedSession: sessionName });
  },

  getInitialState: function () {
    return { sessions: this.props.initialSessions,
             user: this.props.user,
             selectedSession: "",
             kids: this.props.kids };
  },

  render: function () {
    var kid;
    if (this.props.kids.length > 1) {
      kid = _.first(this.props.kids);
    } else { 
      kid = _.first(this.props.kids);
    }
    
    var regBox;
    if (this.state.selectedSession !== "") {
      regBox = <RegistrationsBox user={this.state.user} selectedSession={this.state.selectedSession} kids={kid}  />
    }

    return (
      <div className="container">
        <div className="col-md-8">
          <SessionsBox initialSessions={this.state.sessions} selectedSession={this.state.selectedSession} onSelect={this.handleSelect} />
        </div>
        <div className="col-md-6">
          {regBox}
        </div>
      </div>
      );
  }
});
