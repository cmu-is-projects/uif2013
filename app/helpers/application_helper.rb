module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def reload_flash
    page.replace "flash_messages", :partial => 'layouts/flash'
  end
  
  def get_well_type(priority)
    if priority == 1
      well = "red"
    elsif priority == 2
      well = "yellow"
    else
      well = ""
    end
    well
  end
  
  def get_grade_options
    [['K',0],['1st',1],['2nd',2],['3rd',3],['4th',4],['5th',5],['6th',6],['7th',7],['8th',8],['9th',9],['10th',10],['11th',11],['12th',12]]
  end
  
end
