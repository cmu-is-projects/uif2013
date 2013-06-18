$(document).ready ->
  $("#v_attendance_barcodes input").focus()
  $("#v_attendance_barcodes input").keyup(displayUnicode)

displayUnicode = ->
  _this = this
  @input = $("#v_attendance_barcodes input")
  @display = $('#volunteer_checked')
  
  if @input.val()?.length == 12
    console.log(@input.val())
    $.ajax
      url: '/checkin'
      data:
        barcode: @input.val(),
        event_id: url_query 'event_id'
      success: (data) =>
        # Success if called regardless of whether the actual call succeed, since
        # we are just returning JSON
        if data.error
          alert data.error
        else
          @display.html "<div>#{data.message}</div>"
          setTimeout (->
            _this.display.fadeOut('slow').html('').fadeIn('fast')
          ), 2000
          if data.volunteer_attendees isnt null
            $('#volunteer_attend').html('')
            volunteer_attendees = $('<table/>').addClass("table table-striped")
            headers = $('<thead />')
            headers.append('<tr><th>Volunteer</th><th>Phone Number</th><th>Barcode Number</th><th></th></tr>')
            volunteer_attendees.append(headers)
            attendees_body = $('<tbody/>')
            for i of data.volunteer_attendees
              row = $('<tr />')
              row.append('<td><a href="/volunteers/'+data.volunteer_attendees[i]['id']+'">'+data.volunteer_attendees[i]['last_name']+ ', ' + data.volunteer_attendees[i]['first_name'] + '</a></td>')
              if data.volunteer_attendees[i]['cell_phone'] is null
                row.append('<td>No Phone Number</td>')
              else
                row.append('<td>'+formatPhone(data.volunteer_attendees[i]['cell_phone'])+'</td>')
              row.append('<td>'+data.volunteer_attendees[i]['barcode_number']+'</td>')
              row.append('<td><a href="/notes/new?id='+data.volunteer_attendees[i]['id']+'&source=volunteer" class="btn btn-mini"><i class="icon-file"></i> Add note</a></td>');
              attendees_body.append(row)
            volunteer_attendees.append(attendees_body)
            $('#volunteer_attend').hide().html(volunteer_attendees).show()
          else
            $('#volunteer_attend').html('<h4>No Attendees</h4>')
          if data.volunteer_absentees isnt null and typeof data.volunteer_absentees isnt "undefined"
            $('#volunteer_absent').html('')
            volunteer_absentees = $('<table/>').addClass("table table-striped")
            headers = $('<thead />')
            headers.append('<tr><th>Student</th><th>Phone Number</th><th>Barcode Number</th><th></th></tr>')
            volunteer_absentees.append(headers)
            absentees_body = $('<tbody/>')
            for j of data.volunteer_absentees
              row = $('<tr />')
              row.append('<td><a href="/volunteers/'+data.volunteer_absentees[j]['id']+'">'+data.volunteer_absentees[j]['last_name']+ ', ' + data.volunteer_absentees[j]['first_name'] + '</a></td>')
              if data.volunteer_absentees[j]['cell_phone'] is null
                row.append('<td>No Phone Number</td>')
              else
                row.append('<td>'+formatPhone(data.volunteer_absentees[j]['cell_phone'])+'</td>')
              row.append('<td>'+data.volunteer_absentees[j]['barcode_number']+'</td>')
              row.append('<td><a href="/notes/new?id='+data.volunteer_absentees[j]['id']+'&source=volunteer" class="btn btn-mini"><i class="icon-file"></i> Add note</a></td>');
              absentees_body.append(row)
            volunteer_absentees.append(absentees_body)
            $('#volunteer_absent').hide().html(volunteer_absentees).show()
          else
            $('#volunteer_absent').html('<h4>No Absentees</h4>')
    @input.val('')
    
# Parse URL Queries
url_query = (query) ->
  query = query.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]")
  expr = "[\\?&]" + query + "=([^&#]*)"
  regex = new RegExp(expr)
  results = regex.exec(window.location.href)
  if results isnt null
    results[1]
  else
    false

# Example usage - http://www.kevinleary.net/?load=yes
url_param = url_query("load")
alert url_param  if url_param # "yes"


formatPhone = (phonenum) ->
  regexObj = /^(\d{3})(\d{3})(\d{4})$/
  if regexObj.test(phonenum)
    parts = phonenum.match(regexObj)
    phone = ""
    phone += parts[1] + "-" + parts[2] + "-" + parts[3]
    phone
  else
    #invalid phone number
    phonenum
