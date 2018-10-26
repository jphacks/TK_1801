var io = require('socket.io')(3000);
io.set('origins','*:*');

// 接続確立
io.on('connection', function(socket){

    // DB上のユーザーIDをクエリから受け取る
    // TODO: 嘘つき防止
    var userId = socket.handshake.query.user_id;
    if (!userId) {
        return;
    }
    console.log('user ' + userId + ' connected');

    // クライアントから位置情報を受け取って他のクライアントへ伝える
    socket.on("sendLocationToServer", function (location) {
        socket.broadcast.emit('sendLocationToClient', { "user_id": userId, "location": location });
    });

    // クライアントから接続切れを受け取って他のクライアントへ伝える
    socket.on("disconnect", function () {
        socket.broadcast.emit('sendDisconnectionToClient', { "user_id": userId });
    });

});
