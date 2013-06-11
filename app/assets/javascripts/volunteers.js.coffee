jQuery ->  
  $("#autocomplete_student_first_name").bind('railsAutocomplete.select', (e,data)->  
    $("#volunteer_student_id").val(data.item.id)  
  )  