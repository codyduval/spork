/** @jsx React.DOM */

var SessionsBox = React.createClass({

  handleFilter: function(semesterName) {
    var filteredSessions = _.filter(this.state.sessions, { 'semester': semesterName });
    this.setState({
      filteredSessions: filteredSessions,
      buttonSelected: !this.state.buttonSelected
    });
  },

  componentDidMount: function() {
  },

  getInitialState: function () {

    var buttons = function (sessions) {
      var names = _.uniq(_.pluck(sessions, "semester"));
      var semesterButtons = names.map(function (name, index) { 
        return (
          <SemesterButton name={name} key={index} onFilter={this.handleFilter} isSelected={false} />
          );
      }.bind(this));
    }

    return {sessions: this.props.initialSessions,
            filteredSessions: this.props.initialSessions,
            semesterButtons: buttons(this.props.initialSessions) 
    };
  },

  render: function () {
    var names = _.uniq(_.pluck(this.state.sessions, "semester"));
    var semesterNames = names.map(function (name, index) { 
      return (
        <SemesterButton name={name} key={index} onFilter={this.handleFilter} isSelected={this.state.buttonSelected} />
        );
    }.bind(this));

    return (
      <div>
        <ul className="nav nav-pills">
          {semesterNames}
        </ul>
        <table className="table">
          <SessionHeader />
          <SessionList sessions={this.state.filteredSessions} />
        </table>
      </div>
      );
  }
});
