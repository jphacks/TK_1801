{include file="header.tpl" title="Where are Guides?" user=$user}
<style media="screen">
  .message_bar{
    /* position: absolute;
    bottom: 60px; */
    padding-top: 30px;
    width: 90%;
    text-align: center;
    margin: auto;
  }
  #chatLog{
    width: 90%;
    height: 500px;
    overflow: scroll;
    margin: auto;
    margin-top: 30px;
  }
  #msg{
    width: calc(90% - 140px);
    height: 40px;
    border-radius: 5px;
    border: solid 1px;
    border-color: gray;
    margin: 0 10px 0 0;
  }
  #send{}
  .p-button-modal__open{
    border-radius: 3px;
    height: 40px;
    border: none;
    padding: 4px 15px;
    background-color: #FD5637;
    color: #ffffff
  }
  .btn-gray{
    background-color: #bbb;
    color: #ffffff
  }
</style>
<section class="u-pd-lr30">
{*
  room: <input type="text" id="roomName"> <button id="join">入室</button><button id="leave">退室</button>
  <hr>
*}
  <div id="chatLog">
  </div>
  <div class="message_bar">
    <input type="text" id="msg" placeholder="message">
    <button id="send" class="p-button-modal__open">Send</button>
    <button id="leave" class="p-button-modal__open btn-gray">Exit</button>
  </div>
</section>
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
//$('#join').click(function(){
$(setTimeout(function () {
  room = peer.joinRoom('{$room_id}', { mode: 'sfu' });
  chatlog('The chat has been started.');

  // チャットを送信
  $('#send').click(function(){
     var msg = $('#msg').val();
     room.send(msg);
     chatlog('You > ' + msg);
     $('#msg').val('');
  });

  // チャットを受信
  room.on('data', function(data){
    chatlog('Guide > ' + data.data); // data.src = 送信者のpeerid, data.data = 送信されたメッセージ
  });
}, 2000));

// 退室
$('#leave').click(function(){
    room.close();
    chatlog('Left the chat room.');
    location.href = "{$base_url}review?id={$guidance_id}";
});

// チャットログに記録するための関数
function chatlog(msg){
    $('#chatLog').append('<p>' + msg + '</p>');
}
</script>
{include file="footer.tpl"}
