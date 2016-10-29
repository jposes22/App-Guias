<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Chat App</title>
<link href="bootstrap.css" rel="stylesheet">
 
<style type="text/css">
body {
    padding: 20px;
}
 
#console {
    height: 400px;
    overflow: auto;
}
 
.username-msg {
    color: orange;
}
 
.connect-msg {
    color: green;
}
 
.disconnect-msg {
    color: red;
}
 
.send-msg {
    color: #888
}
</style>
 
<script type="text/javascript" src="js/socket.io/socket.io.js"></script>
<script type="text/javascript" src="js/moment.min.js"></script>
<script type="text/javascript"
    src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
 
<script type="text/javascript">
    var userName = 'user' + Math.floor((Math.random() * 1000) + 1);
 
    var socket = io.connect('http://localhost:80');
 
    socket
            .on(
                    'connect',
                    function() {
                        output('<span class="connect-msg">Client has connected to the server!</span>');
                    });
 
    socket.on('chatevent', function(data) {
        output('<span class="username-msg">' + data.userName + ':</span> '
                + data.message);
    });
 
    socket.on('disconnect', function() {
        output('<span class="disconnect-msg">The Client(' + userName
                + ') has disconnected!</span>');
    });
 
    function sendDisconnect() {
        socket.disconnect();
    }
 
    function sendMessage() {
        var message = $('#msg').val();
        $('#msg').val(' ');
 
        var jsonObject = {
            userName : userName,
            message : message
        };
 
        socket.emit('chatevent', jsonObject);
    }
 
    function output(message) {
        var currentTime = "<span class='time'>"
                + moment().format('HH:mm:ss.SSS') + "</span>";
        var element = $("<div>" + currentTime + " " + message + "</div>");
        $('#console').prepend(element);
    }
</script>
</head>
<body>
 
    <h1>My Chat App</h1>
    <br />
 
    <div id="console" class="well"></div>
 
    <form class="well form-inline" onsubmit="return false;">
        <input id="msg" class="input-xlarge" type="text"/>
        <button type="button" onClick="sendMessage()" class="btn">Send</button>
        <button type="button" onClick="sendDisconnect()" class="btn">Disconnect</button>
    </form>
</body>
</html>