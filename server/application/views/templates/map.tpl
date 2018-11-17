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
  .navbar {
    margin-bottom: 0px;
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
  .p-user_icon_sm{
    width: 40px;
    height: 40px;
    object-fit: cover;
    border-radius: 250px;
    border: solid 1px #FD5637;
    margin-bottom: 10px;
    margin-right: 10px;
  }
</style>
<!-- Button trigger modal -->
<button type="button" id="btn-calling-modal" class="btn btn-primary" data-toggle="modal" data-target="#calling-modal" style="display:none">
  Calling modal
</button>
<button type="button" id="btn-waiting-modal" class="btn btn-primary" data-toggle="modal" data-target="#waiting-modal" style="display:none">
  Waiting modal
</button>

<!-- Modal -->
<div class="modal fade" id="waiting-modal" tabindex="-1" role="dialog" aria-labelledby="waiting-modal-label" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <span class="media-left">
          <img id="waiting-modal-profile-img" class="p-user_icon" src="">
        </span>
        <div class="media-body u-pl30">
      		<h4 id="waiting-modal-message" class="media-heading u-pt30"></h4>
        </div>
      </div>
      <div id="waiting-modal-menu" class="modal-body text-center">
        <button id="waiting-modal-btn-accept" type="button" class="p-button-modal__open">Start Chat</button>
        <button id="waiting-modal-btn-decline" type="button" class="p-button-modal__close u-ml30" data-dismiss="modal">Decline</button>
      </div>
      <div id="waiting-modal-menu-ok" class="modal-body text-center" style="display:none">
        <button type="button" class="p-button-modal__close u-ml30" data-dismiss="modal">OK</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="calling-modal" tabindex="-1" role="dialog" aria-labelledby="calling-modal-label" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <span class="media-left">
          <img id="calling-modal-profile-img" class="p-user_icon" src="">
        </span>
        <div class="media-body u-pl30">
      		<h4 id="calling-modal-message" class="media-heading u-pt30"></h4>
        </div>
      </div>
      <div id="calling-modal-menu" class="modal-body text-center">
        <button id="calling-modal-btn-cancel" type="button" class="p-button-modal__close u-ml30" data-dismiss="modal">Cancel</button>
      </div>
      <div id="calling-modal-menu-ok" class="modal-body text-center" style="display:none">
        <button id="calling-modal-btn-cancel" type="button" class="p-button-modal__close u-ml30" data-dismiss="modal">OK</button>
      </div>
    </div>
  </div>
</div>

<div class="row">
  <div class="col-sm-12">
    <div id="map" style="width:100%;height:88vh;"></div>
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
var names = {};
function updateMarker(userId, name, position, type) {
  if (markers[userId]) {
    markers[userId].setPosition(position);
  } else {
    markers[userId] = new google.maps.Marker({ position: position, map: map,
    icon: (type == 'guide') ? null : {
      fillColor: (type == 'me') ? "#0000B0" : (type == 'guide') ? "#FF4040" : "#4040FF",                //塗り潰し色
      fillOpacity: 0.8,                    //塗り潰し透過率
      path: google.maps.SymbolPath.CIRCLE, //円を指定
      scale: (type == 'tourist') ? 0 : 10,   //円のサイズ
      strokeColor: (type == 'me') ? "#000080" : (type == 'guide') ? "#FF0000" : "#0000FF",              //枠の色
      strokeWeight: 1.0                    //枠の透過率
    },
    label: (type == 'me') ? { text: 'You', color:'#FFFFFF', fontSize: '10px' } : null });
    var infoWindow  = new google.maps.InfoWindow({ // 吹き出しの追加
      content: '<div><img class="p-user_icon_sm" src="{$base_url}/storage/profile_image/' + userId + '">' + name + ' <button class="btn btn-sm btn-primary btn-block" onclick="sendRequest(' + userId + ')">Request!</button></div>' // 吹き出しに表示する内容
    });
    names[userId] = name;
    if (userId != {$user['id']}) {
      markers[userId].addListener('click', function() { // マーカーをクリックしたとき
        infoWindow.open(map, markers[userId]); // 吹き出しの表示
      });
    }
  }
}

function removeMarker(userId) {
  markers[userId].setMap(null);
}

var room;

function sendRequest(destUserId) {
  room.send(JSON.stringify({
    type: 'request',
    userId: {$user['id']},
    destUserId: destUserId,
    name: '{$user["name"]|escape|escape:"quotes"}'
  }));
  $('#calling-modal-message').text('Calling ' + names[destUserId] + ' ...');
  $('#calling-modal-profile-img').attr('src', '{$base_url}/storage/profile_image/' + destUserId);
  $('#calling-modal-btn-cancel').click(function () {
    cancelRequest(destUserId);
  });
  $('#calling-modal-menu').show();
  $('#calling-modal-menu-ok').hide();
  $('#btn-calling-modal').click();
}

function cancelRequest(destUserId) {
  room.send(JSON.stringify({
    type: 'cancel',
    userId: {$user['id']},
    destUserId: destUserId
  }));
}

function declineRequest(destUserId) {
  room.send(JSON.stringify({
    type: 'decline',
    userId: {$user['id']},
    destUserId: destUserId
  }));
}

function acceptRequest(destUserId) {
  room.send(JSON.stringify({
    type: 'accept',
    userId: {$user['id']},
    destUserId: destUserId
  }));
}

// peerオブジェクト
const peer = new Peer({
  key: '61c46edf-bdc8-429a-ba29-ccaf61eb1f19', // 自分のAPIキーを入力
  debug: 3
});

setTimeout(function () {
  room = peer.joinRoom('location', { mode: 'sfu' });
	console.log(room);

  // 位置情報を定期送信
  setInterval(function () {
    // 現在位置を取得
    navigator.geolocation.getCurrentPosition(function (position) {
      console.log(position);
      room.send(JSON.stringify({
        type: 'location',
        userId: {$user['id']},
        name: '{$user["name"]|escape|escape:"quotes"}',
        position: convertPosition(position),
        userType: '{$user["type"]|escape|escape:"quotes"}'
      }));
      updateMarker({$user['id']}, '{$user["name"]|escape|escape:"quotes"}', convertPosition(position), 'me');
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
        updateMarker(d.userId, d.name, d.position, d.userType);
        break;
      case 'disconnection':
        // 他の人の接続切れをサーバーから受け取った時(地図上のマーカーを削除)
        removeMarker(d.userId);
        break;
      case 'request':
        // ガイド依頼の呼び出しをサーバーから受け取った時(呼び出しモーダルを表示)
        if (d.destUserId == {$user['id']}) {
          $('#waiting-modal-message').text(d.name + ' scouted you!!');
          $('#waiting-modal-profile-img').attr('src', '{$base_url}/storage/profile_image/' + d.userId);
          $('#waiting-modal-btn-decline').click(function () {
            declineRequest(d.userId);
          });
          $('#waiting-modal-btn-accept').click(function () {
            acceptRequest(d.userId);
            location.href = '/chat?room=' + d.userId;
          });
          $('#waiting-modal-menu').show();
          $('#waiting-modal-menu-ok').hide();
          $('#btn-waiting-modal').click();
        }
        break;
      case 'cancel':
        // ガイド依頼の呼び出しキャンセルをサーバーから受け取った時(呼び出しモーダルを閉じる)
        if (d.destUserId == {$user['id']}) {
          $('#waiting-modal-message').text('The request from ' + d.name + ' has been cancelled.');
          $('#waiting-modal-menu').hide();
          $('#waiting-modal-menu-ok').show();
        }
        break;
      case 'decline':
        // ガイド依頼の呼び出し拒否をサーバーから受け取った時(呼び出しモーダルを閉じる)
        if (d.destUserId == {$user['id']}) {
          $('#calling-modal-message').text('Your request has been declined.');
          $('#calling-modal-menu').hide();
          $('#calling-modal-menu-ok').show();
        }
        break;
      case 'accept':
        // ガイド依頼の呼び出し承諾をサーバーから受け取った時(呼び出しモーダルを閉じる)
        if (d.destUserId == {$user['id']}) {
          location.href = '/chat?room=' + d.destUserId + '&tourist=' + d.userId + '&guide=' + d.destUserId;
        }
        break;
      default:
        console.log('Undefined type: ' + d.type);
    }
  });
}, 2000);

</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCvvoPaN9Wdcyka3M5dDefxCJX3Kl4jUTU&callback=initMap"></script>
{include file="footer.tpl"}
