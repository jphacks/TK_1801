{include file="header.tpl" title="Where are Guides?"}

<div class="row">
  <div class="col-sm-12">
    <div id="map" style="width:100%;height:calc(100vh - 180px)"></div>
  </div>
</div>

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
    function () {
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
</script>
<script src="https://maps.googleapis.com/maps/api/js?callback=initMap"></script>
{include file="footer.tpl"}
