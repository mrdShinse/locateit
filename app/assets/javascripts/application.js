// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require materialize
//= require_tree .

window.onload = function() {
  let elem = document.querySelector('.sidenav');
  let instance = M.Sidenav.init(elem, {})

  const clickablePins = document.getElementsByClassName('clickable-pin')
  for (i = 0; i < clickablePins.length; i++) {
    const pin = clickablePins[i];
    pin.addEventListener('click', function() {
      renderWholeMap({ center: makeGmapLatlng(pin.dataset.lat, pin.dataset.lng), zoom: 12 })
    });
  }
}
