/** @jsx React.DOM */

var RegistrationsList = React.createClass({
  render: function () {
    return (
      <div>
        <thead>
          <tr>
            <td><h2>Selected Session</h2></td>
            <td><h2>Child</h2></td>
            <td><h2>Price</h2></td>
            <td></td>
          </tr>
        </thead>
        <tbody className="registration-list">
          <tr>
            <td>
              <div className="session-name">
                {this.props.selectedSession}
              </div>
            </td>
            <td>
              <div className="session-child">
                {this.props.kids.first_name}
              </div>
            </td>
            <td>
              <div className="session-price">
                $45 
              </div>
            </td>
            <td>
              <div className="session-submit">
                <button onClick={this.handleSubmit} className={'btn btn-success'}>Check Out</button>
              </div>
            </td>
          </tr>
        </tbody>
      </div>
    );
  }
});
