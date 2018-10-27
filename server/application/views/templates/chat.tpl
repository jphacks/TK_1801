{include file="header.tpl" title="Where are Guides?" user=$user}


    room: <input type="text" id="roomName"> <button id="join">入室</button>
    <br><button id="leave">退室</button>
    <hr>
    <input type="text" id="msg" placeholder="チャットを入力"> <button id="send">send</button>
    <hr>
    <div id="chatLog">

    </div>

    <script type="text/javascript" src="https://cdn.webrtc.ecl.ntt.com/skyway-latest.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


<script>
    // peerオブジェクト
    const peer = new Peer({
        key: '61c46edf-bdc8-429a-ba29-ccaf61eb1f19', // 自分のAPIキーを入力
        debug: 3
    });

    // 入室
    let room = null;
    $('#join').click(function(){
        room = peer.joinRoom($('#roomName').val(), { mode: 'sfu' });
        chatlog('<i>' + $('#roomName').val() + '</i>に入室しました');

        // チャットを送信
        $('#send').click(function(){
            var msg = $('#msg').val();
            room.send(msg);
            chatlog('自分> ' + msg);
        });

        // チャットを受信
        room.on('data', function(data){
            chatlog('ID: ' + data.src + '> ' + data.data); // data.src = 送信者のpeerid, data.data = 送信されたメッセージ
        });
    });

// 退室
$('#leave').click(function(){
    room.close();
    chatlog('<i>' + $('#roomName').val() + '</i>から退室しました');
})


// チャットログに記録するための関数
function chatlog(msg){
    $('#chatLog').append('<p>' + msg + '</p>');
}
</script>
{include file="footer.tpl"}
