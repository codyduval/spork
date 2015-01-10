/** @jsx React.DOM */

var SessionsBox = React.createClass({

  handleFilter: function(semesterName) {
    var filteredSessions = _.filter(this.state.sessions, { 'semester': semesterName });
    this.setState({
      filteredSessions: filteredSessions 
    });
  },

  getInitialState: function () {
    return {sessions: this.props.initialSessions,
            filteredSessions: this.props.initialSessions};
  },

  render: function () {
    var names = _.uniq(_.pluck(this.state.sessions, "semester"));
    var semesterNames = names.map(function (name, index) { 
      return (
        <SemesterButton name={name} key={index} onFilter={this.handleFilter} />
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
