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
//= require_tree .


var xmlhttp;

function loadXMLDoc() {
  if (xmlhttp == null) { xmlhttp = new XMLHttpRequest(); }

  serversHTML = document.getElementById("servers");

  if (serversHTML == null) {
    return;
  }

  xmlhttp.onreadystatechange = function () {
    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
      document.getElementById("servers").innerHTML = xmlhttp.responseText;
    }
  };

  xmlhttp.open("GET", "https://api.megamek.org/servers.js", true);
  xmlhttp.send();
}

setInterval(function () { loadXMLDoc(); }, 1000);
