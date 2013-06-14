var displayUnicode, formatPhone, url_param, url_query;

$(document).ready(function() {
  $("#volunteer_barcodes input").focus();
  return $("#volunteer_barcodes input").keyup(displayUnicode);
});

displayUnicode = function() {
  var _ref,
    _this = this;
  _this = this;
  this.input = $("#volunteer_barcodes input");
  this.display = $('#volunteer_checked');
  if (((_ref = this.input.val()) != null ? _ref.length : void 0) === 12) {
    $.ajax({
      url: '/volunteer_checkin',
      data: {
        barcode: this.input.val(),
        event_id: url_query('event_id')
      },
      success: function(data) {
        var absentees_body, attendees_body, headers, i, j, row, volunteer_absentees, volunteer_attendees;
        if (data.error) {
          return alert(data.error);
        } else {
          _this.display.html("<div>" + data.message + "</div>");
          setTimeout((function() {
            return _this.display.fadeOut('slow').html('').fadeIn('fast');
          }), 2000);
          if (data.volunteer_attendees !== null) {
            $('#volunteer_attend').html('');
            volunteer_attendees = $('<table/>').addClass("table table-striped");
            headers = $('<thead />');
            headers.append('<tr><th>Volunteer</th><th>Phone Number</th><th>Barcode Number</th><th></th></tr>');
            volunteer_attendees.append(headers);
            attendees_body = $('<tbody/>');
            for (i in data.volunteer_attendees) {
              row = $('<tr />');
              row.append('<td><a href="/volunteers/' + data.volunteer_attendees[i]['id'] + '">' + data.volunteer_attendees[i]['last_name'] + ', ' + data.volunteer_attendees[i]['first_name'] + '</a></td>');
              if (data.volunteer_attendees[i]['cell_phone'] === null) {
                row.append('<td>No Phone Number</td>');
              } else {
                row.append('<td>' + formatPhone(data.volunteer_attendees[i]['cell_phone']) + '</td>');
              }
              row.append('<td>' + data.volunteer_attendees[i]['barcode_number'] + '</td>');
              row.append('<td><a href="/notes/new?id=' + data.volunteer_attendees[i]['id'] + '&source=volunteer" class="btn btn-mini"><i class="icon-file"></i> Add note</a></td>');
              attendees_body.append(row);
            }
            volunteer_attendees.append(attendees_body);
            $('#volunteer_attend').hide().html(volunteer_attendees).show();
          } else {
            $('#volunteer_attend').html('<h4>No Attendees</h4>');
          }
          if (data.volunteer_absentees !== null && typeof data.volunteer_absentees !== "undefined") {
            $('#volunteer_absent').html('');
            volunteer_absentees = $('<table/>').addClass("table table-striped");
            headers = $('<thead />');
            headers.append('<tr><th>Volunteer</th><th>Phone Number</th><th>Barcode Number</th><th></th></tr>');
            volunteer_absentees.append(headers);
            absentees_body = $('<tbody/>');
            for (j in data.volunteer_absentees) {
              row = $('<tr />');
              row.append('<td><a href="/volunteers/' + data.volunteer_absentees[j]['id'] + '">' + data.volunteer_absentees[j]['last_name'] + ', ' + data.volunteer_absentees[j]['first_name'] + '</a></td>');
              if (data.volunteer_absentees[j]['cell_phone'] === null) {
                row.append('<td>No Phone Number</td>');
              } else {
                row.append('<td>' + formatPhone(data.volunteer_absentees[j]['cell_phone']) + '</td>');
              }
              row.append('<td>' + data.volunteer_absentees[j]['barcode_number'] + '</td>');
              row.append('<td><a href="/notes/new?id=' + data.volunteer_absentees[j]['id'] + '&source=volunteer" class="btn btn-mini"><i class="icon-file"></i> Add note</a></td>');
              absentees_body.append(row);
            }
            volunteer_absentees.append(absentees_body);
            return $('#volunteer_absent').hide().html(volunteer_absentees).show();
          } else {
            return $('#volunteer_absent').html('<h4>No Absentees</h4>');
          }
        }
      }
    });
    return this.input.val('');
  }
};

url_query = function(query) {
  var expr, regex, results;
  query = query.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
  expr = "[\\?&]" + query + "=([^&#]*)";
  regex = new RegExp(expr);
  results = regex.exec(window.location.href);
  if (results !== null) {
    return results[1];
  } else {
    return false;
  }
};

url_param = url_query("load");

if (url_param) {
  alert(url_param);
}

formatPhone = function(phonenum) {
  var parts, phone, regexObj;
  regexObj = /^(\d{3})(\d{3})(\d{4})$/;
  if (regexObj.test(phonenum)) {
    parts = phonenum.match(regexObj);
    phone = "";
    phone += parts[1] + "-" + parts[2] + "-" + parts[3];
    return phone;
  } else {
    return phonenum;
  }
};
