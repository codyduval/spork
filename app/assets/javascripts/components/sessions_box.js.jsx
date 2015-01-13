/** @jsx React.DOM */

var SessionsBox = React.createClass({

  handleFilter: function(semesterName) {
    var filteredSessions = _.filter(this.props.initialSessions, { 'semester': semesterName });
    this.setState({
      filteredSessions: filteredSessions,
      selectedSemester: semesterName
    });
  },

  componentDidMount: function() {
    return { filteredSessions: this.handleFilter(this.state.selectedSemester) };
  },

  getInitialState: function () {
    var defaultSemester = _.first(_.uniq(_.pluck(this.props.initialSessions, "semester")));
    return {filteredSessions: [],
            selectedSemester: defaultSemester
    };
  },

  render: function () {
    var names = _.uniq(_.pluck(this.props.initialSessions, "semester"));
    var semesterButtons = names.map(function (name, index) { 
      return (
        <SemesterButton name={name} key={index} onFilter={this.handleFilter} currentSelected={this.state.selectedSemester} />
        );
    }.bind(this));

    return (
      <div>
        <ul className="nav nav-pills">
          {semesterButtons}
        </ul>
        <table className="table">
          <SessionHeader />
          <SessionList sessions={this.state.filteredSessions} selectedSession={this.props.selectedSession} />
        </table>
      </div>
      );
  }
});
