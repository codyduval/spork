/** @jsx React.DOM */

var ready = function () {
  React.render(
    <SessionsBox url="/session_registration/open_sessions.json" />,
    document.getElementById('open-sessions')
  );
};

$(document).ready(ready);
