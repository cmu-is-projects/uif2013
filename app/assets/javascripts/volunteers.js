function toggle_visibility(id) {
   var e = document.getElementById(id);
   if(e.style.display == 'block')
      e.style.display = 'none';
   else
      e.style.display = 'block';
}

function toggleDiv(divid){
 
    varon = divid + 'on';
    varoff = divid + 'off';
    if(document.getElementById(varon).style.display == 'none')
    {
      $('#toggle').text('Link to Student Profile');
      document.getElementById(varon).style.display = 'block';
      document.getElementById(varoff).style.display = 'none';
    }
    else
    {
      $('#toggle').text('Cancel Link');
      document.getElementById(varoff).style.display = 'block';
      document.getElementById(varon).style.display = 'none';
    }
 
 }
 
  $(function() {
    $( "#tags" ).autocomplete({
      source: '<%= volunteer_path(:format => :json) %>'
    });
  });