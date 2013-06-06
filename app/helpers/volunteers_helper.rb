module VolunteersHelper
  def get_volunteers
    Volunteer.alphabetical.all.map{|h| ["#{h.proper_name}", h.id] }
  end
end

