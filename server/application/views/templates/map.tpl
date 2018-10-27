{include file="header.tpl" title="Where are Guides?" user=$user}
<style media="screen">
  .btn-primary{
    background-color: #c78836;
    border: none;
  }
  .btn-primary:hover, .btn-primary:focus,
  .btn-primary:active, .btn-primary:active:focus, .btn-primary:active:hover, .btn-primary:active.focus,
  .btn-primary.active, .btn-primary.active:focus, .btn-primary.active:hover, .btn-primary.active.focus,
  .open > .dropdown-toggle.btn-primary,
  .open > .dropdown-toggle.btn-primary:hover,
  .open > .dropdown-toggle.btn-primary:focus,
  .open > .dropdown-toggle.btn-primary.focus,
  .btn-primary.disabled:hover, .btn-primary[disabled]:hover, fieldset[disabled] .btn-primary:hover,
  .btn-primary.disabled:focus, .btn-primary[disabled]:focus, fieldset[disabled] .btn-primary:focus,
  .btn-primary.disabled.focus, .btn-primary[disabled].focus, fieldset[disabled] .btn-primary.focus {
    background:rgba( 254 , 175 , 69 );; //ボタンの上にポインタを持ってきたり、クリックしたりした時の背景色
    color: white; //ボタンの上にポインタを持ってきたり、クリックしたりした時のテキストの色
    border: 2px solid #FEAF45s;

  }

  .btn-primary.outline {
      border: 3px solid rgba( 254 , 175 , 69 );; //アウトラインのみのボタンの線の色
      color: white ; //アウトラインのみのボタンのテキストの色
  }
  .p-user_icon{
    width: 100px;
    height: 100px;
    border-radius: 200px;
    border: solid 1px #FD5637;
  }
  .p-button-modal__open{
    width: 40%;
    border-radius: 20px;
    line-height: 40px;
    border: none;
    background-color: #FD5637;
    color: #ffffff
  }
  .p-button-modal__close{
    width: 40%;
    border-radius: 20px;
    line-height: 40px;
    border: none;
    background-color: gray;
    color: #ffffff
  }
</style>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <span class="media-left">
          <img class="p-user_icon" src="../images/user.jpg">
        </span>
        <div class="media-body u-pl30">
      		<h4 class="media-heading u-pt30">{$user['name']|escape} Scouted you!!</h4>
        </div>
      </div>
      <div class="modal-body text-center">
        <button type="button" class="p-button-modal__open">Start Chat</button>
        <button type="button" class="p-button-modal__close u-ml30" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
  $('#myModal').on('shown.bs.modal', function () {
    $('#myInput').trigger('focus')
  })
</script>



<div class="row">
  <div class="col-sm-12">
    <div id="map" style="width:100%;height:500px;"></div>
  </div>
</div>

<script type="text/javascript" src="https://cdn.webrtc.ecl.ntt.com/skyway-latest.js"></script>
<script>
var map;
function initMap() {
  if(navigator.geolocation) {
    // 現在位置を取得
    navigator.geolocation.getCurrentPosition(function (position) {
      var pos = convertPosition(position);
      map = new google.maps.Map(document.getElementById('map'), {
        center: pos,
        zoom: 19
      });
    },
    function (error) {
      alert('Your device doesn\'t support Geolocation API.');
    });
  }
}

function convertPosition(position) {
  return { lat: position.coords.latitude, lng: position.coords.longitude };
}

var markers = {};
function updateMarker(userId, position) {
  if (markers[userId]) {
    markers[userId].setPosition(position);
  } else {
    markers[userId] = new google.maps.Marker({ position: position, map: map });
  }
}

function removeMarker(userId) {
  markers[userId].setMap(null);
}

// peerオブジェクト
const peer = new Peer({
  key: '61c46edf-bdc8-429a-ba29-ccaf61eb1f19', // 自分のAPIキーを入力
  debug: 3
});

var room;
setTimeout(function () {
  room = peer.joinRoom('location', { mode: 'sfu' });

  // 位置情報を定期送信
  setInterval(function () {
    // 現在位置を取得
    navigator.geolocation.getCurrentPosition(function (position) {
      console.log(position);
      room.send(JSON.stringify({ type: 'location', userId: {$user['id']}, position: convertPosition(position) }));
    },
    function (error) {
      console.log('Failed to get current position.');
    });
  }, 5000);

  // 受信
  room.on('data', function(data){
    // data.src = 送信者のpeerid, data.data = 送信されたメッセージ
    console.log('Received: ' + data.data);
    var d = JSON.parse(data.data);
    switch (d.type) {
      case 'location':
        // 位置情報をサーバーから受け取った時(地図上のマーカーを更新)
        updateMarker(d.userId, d.position);
        break;
      case 'disconnection':
        // 他の人の接続切れをサーバーから受け取った時(地図上のマーカーを削除)
        removeMarker(d.userId);
        break;
      default:
        console.log('Undefined type: ' + d.type);
    }
  });
}, 1000);

</script>
<script src="https://maps.googleapis.com/maps/api/js?callback=initMap"></script>
{include file="footer.tpl"}
