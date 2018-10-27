{include file="header.tpl" title="Where are Guides?"}

<div class="row">
  <div class="col-sm-12">
    <div id="map" style="width:100%;height:calc(100vh - 180px)"></div>
  </div>
</div>

<script>
var map;
var markers = [];
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {
      lat: 34.7019399, // 緯度
      lng: 135.51002519999997 // 経度
    },
    zoom: 19
  });
  markers.push(new google.maps.Marker({ position: {
    lat: 34.7019399, // 緯度
    lng: 135.51002519999997 // 経度
  }, map: map }));
}
</script>
<script src="https://maps.googleapis.com/maps/api/js?callback=initMap"></script>
{include file="footer.tpl"}
