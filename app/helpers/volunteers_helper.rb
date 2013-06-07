module VolunteersHelper
  def get_volunteers
    Volunteer.alphabetical.all.map{|h| ["#{h.proper_name}", h.id] }
  end
  def get_students
    Student.alphabetical.all.map{|h| ["#{h.proper_name}", h.id] }
  end
  def narrowdown_students
    @volunteer_first_name.alphabetical.all.map{|h| ["#{h.proper_name}", h.id] }
  end 
end

