module StudentsHelper
  def get_households
    Household.alphabetical.all.map{|h| ["#{h.name} (#{h.street})", h.id] }
  end

  def get_schools
  	School.alphabetical.all.map{|s| ["#{s.name} (#{s.category})", s.id] }
  end

end
