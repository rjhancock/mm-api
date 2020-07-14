var xmlhttp;

function loadXMLDoc() {
  if (xmlhttp == null) {xmlhttp = new XMLHttpRequest(); }

  xmlhttp.onreadystatechange = function() {
    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
    document.getElementById("servers").innerHTML = xmlhttp.responseText;
    }
  }

  xmlhttp.open("GET" ,"/servers.js", true);
  xmlhttp.send();
}

setInterval(function() {loadXMLDoc(); }, 1000);
