function show_result(data)
{
  var result = $('#result');

  if (data.type !== "String")
  {
    result.append("<hr/>Result : " + data.value.join(', '));
  }
  else
  {
    result.append("<hr/>adsda" + data.value + "<tr/>");
  }
}

$(document).ready(function()
{
 $("#calc_form").bind("ajax:success", function(xhr, data, status) { show_result(xhr.detail[0]) } )
})

function send_query(){ 
  var frm = document.forms.calc_form; 
  var param_str = ""; 
  var value1 = frm.input.value; 
  param_str = "?" + "next_level=" + value1; 
  if (param_str == "") return false; 
  var my_JSON_object = {}; 
  funk_url = location.protocol + "//" + location.host + "/levels/show.json"; 
  var http_request = new XMLHttpRequest(); 
  http_request.open("GET", funk_url + param_str, true); 
  http_request.onreadystatechange = function () { 
    var done = 4, ok = 200; 
    if (http_request.readyState == done && http_request.status == ok) {
      my_JSON_object = JSON.parse(http_request.responseText); 
      show_result(my_JSON_object); 
    } 
  } 
  http_request.send(null); 
  return false; 
}