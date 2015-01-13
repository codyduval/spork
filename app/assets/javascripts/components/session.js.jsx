/** @jsx React.DOM */

var Session = React.createClass({

  handleSelect: function (e) {
    this.props.onSelect(this.props.name);
  },

  render: function () {
    var classString;

    if(this.props.selectedSession === this.props.name) {
      classString = 'btn btn-inverse'
      buttonText = 'Selected'
    } else {
      classString = 'btn btn-primary'
      buttonText = 'Select'
    }

    return (
      <tr>
        <td>
          <div className="session-name">
            {this.props.name}
          </div>
        </td>
        <td>
          <div className="session-start-time">
            {this.props.start_time}
          </div>
        </td>
        <td>
          <div className="session-end-time">
            {this.props.end_time}
          </div>
        </td>
        <td>
          <div className="session-days-of-week">
            {this.props.days_of_week}
          </div>
        </td>
        <td>
          <div className="session-select">
            <button onClick={this.handleSelect} parentName={this.props.name} selectedSession={this.props.selectedSession} className={classString}>{buttonText}</button>
          </div>
        </td>
      </tr>
      );
  }
});
