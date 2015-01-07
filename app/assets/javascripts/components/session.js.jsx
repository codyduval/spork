/** @jsx React.DOM */

var Session = React.createClass({
  render: function () {
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
      </tr>
      );
  }
});
