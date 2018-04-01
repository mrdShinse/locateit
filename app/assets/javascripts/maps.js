function makeGmap(id, prop) {
  return new google.maps.Map(document.getElementById(id), prop);
}

function makeGmapMarker(map, option) {
  new google.maps.Marker(option).setMap(map);
}

function makeGmapLatlng(lat, lng) {
  return new google.maps.LatLng(lat, lng);
}

function renderWholeMap() {
  const prop = {
    center: makeGmapLatlng(35.729503, 139.710900),
    zoom: 2,
  };
  const map = makeGmap('gmap-container', prop);
  makeGmapMarker(map, { position: prop.center });

  const pins = document.getElementById('pins-data-list').children
  for (let i = 0; i < pins.length; i++) {
    const pin = pins[i];
    makeGmapMarker(map, { position: makeGmapLatlng(pin.attributes['data-lat'].value, pin.attributes['data-lng'].value) });
  }
}

function renderPin() {
  const pins = document.getElementById('pins-data-list').children
  for (let i = 0; i < pins.length; i++) {
    const pin = pins[i];
    const prop = {
      center: makeGmapLatlng(pin.attributes['data-lat'].value, pin.attributes['data-lng'].value),
      zoom: 12,
    };
    const map = makeGmap('gmap-container', prop);
    makeGmapMarker(map, { position:  prop.center});
  }
}
