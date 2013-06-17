$(document).ready ->
  $("#attendance_barcodes input").focus()
  $("#attendance_barcodes input").keyup(displayUnicode)

displayUnicode = ->
  _this = this
  @input = $("#attendance_barcodes input")
  @display = $('#student_checked')
  
  if @input.val()?.length == 12
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
          if data.student_attendees isnt null
            $('#attend').html('')
            student_attendees = $('<table/>').addClass("table table-striped")
            headers = $('<thead />')
            headers.append('<tr><th>Student</th><th>Phone Number</th><th>Barcode Number</th><th></th></tr>')
            student_attendees.append(headers)
            attendees_body = $('<tbody/>')
            for i of data.student_attendees
              row = $('<tr />')
              row.append('<td><a href="/students/'+data.student_attendees[i]['id']+'">'+data.student_attendees[i]['last_name']+ ', ' + data.student_attendees[i]['first_name'] + '</a></td>')
              if data.student_attendees[i]['cell_phone'] is null
                row.append('<td>No Phone Number</td>')
              else
                row.append('<td>'+formatPhone(data.student_attendees[i]['cell_phone'])+'</td>')
              if data.student_attendees[i]['is_visitor']
                row.append('<td><i class="icon-flag"></i>'+data.student_attendees[i]['barcode_number']+'</td>')
              else
                row.append('<td>'+data.student_attendees[i]['barcode_number']+'</td>')
              row.append('<td><a href="/notes/new?id='+data.student_attendees[i]['id']+'&source=student" class="btn btn-mini"><i class="icon-file"></i> Add note</a></td>');
              attendees_body.append(row)
            student_attendees.append(attendees_body)
            $('#attend').hide().html(student_attendees).show()
          else
            $('#attend').html('<h4>No Attendees</h4>')
          if data.student_absentees isnt null and typeof data.student_absentees isnt "undefined"
            $('#absent').html('')
            student_absentees = $('<table/>').addClass("table table-striped")
            headers = $('<thead />')
            headers.append('<tr><th>Student</th><th>Phone Number</th><th>Barcode Number</th><th></th></tr>')
            student_absentees.append(headers)
            absentees_body = $('<tbody/>')
            for j of data.student_absentees
              row = $('<tr />')
              row.append('<td><a href="/students/'+data.student_absentees[j]['id']+'">'+data.student_absentees[j]['last_name']+ ', ' + data.student_absentees[j]['first_name'] + '</a></td>')
              if data.student_absentees[j]['cell_phone'] is null
                row.append('<td>No Phone Number</td>')
              else
                row.append('<td>'+formatPhone(data.student_absentees[j]['cell_phone'])+'</td>')
              row.append('<td>'+data.student_absentees[j]['barcode_number']+'</td>')
              row.append('<td><a href="/notes/new?id='+data.student_absentees[j]['id']+'&source=student" class="btn btn-mini"><i class="icon-file"></i> Add note</a></td>');
              absentees_body.append(row)
            student_absentees.append(absentees_body)
            $('#absent').hide().html(student_absentees).show()
          else
            $('#absent').html('<h4>No Absentees</h4>')
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
