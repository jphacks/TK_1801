{include file="header.tpl" title="Where are Guides?" user=$user}

<div class="row">
  <div class="col-sm-12">
    <div id="map" style="width:100%;height:calc(100vh - 180px)"></div>
  </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.1.1/socket.io.slim.js"></script>
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

var socket = io.connect('http://202.182.125.217:3000', { transports: ["websocket"], query: 'user_id=' + {$user['id']} });

socket.on('sendLocationToClient', function (data) {
  // 位置情報をサーバーから受け取った時(地図上のマーカーを更新)
  updateMarker(data.userId, data.location);
});

socket.on('sendDisconnectionToClient', function (data) {
  // 他の人の接続切れをサーバーから受け取った時(地図上のマーカーを削除)
  removeMarker(data.userId);
});

setInterval(function () {
  // 現在位置を取得
  navigator.geolocation.getCurrentPosition(function (position) {
    console.log(position);
    socket.emit('sendLocationToServer', convertPosition(position));
  },
  function (error) {
    console.log('Failed to get current position.');
  });
}, 5000);

</script>
<script src="https://maps.googleapis.com/maps/api/js?callback=initMap"></script>
{include file="footer.tpl"}
