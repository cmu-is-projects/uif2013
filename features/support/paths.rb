module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #

  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'  
      
    when /the Dashboard/
      '/'
      
    #### USERS
    when /the login page/
      new_user_session_path
    
    #### DEPARTMENTS
    
    #### LOCATIONS
    
    #### PROGRAMS
    when /the new program page/
      new_program_path
      
    when /the program index page/
      programs_path

    when /the Choir page/
      program_path(@choir)
      
    when /the edit Choir page/
      edit_program_path(@choir)
      
    when /the Soccer page/
      program_path(@soccer)
      
    when /the edit Soccer page/
      edit_program_path(@soccer)
      
    when /the Soup Kitchen page/
      program_path(@soupkitchen)
      
    when /the edit Soup Kitchen page/
      edit_program_path(@soupkitchen)
      
    #### SECTIONS
    
    #### EVENTS
    
    #### HOUSEHOLDS
    
    #### STUDENTS
    
    #### GUARDIANS
    
    #### MEDICAL_CONDITIONS
    
    #### OTC_DRUGS
    
    #### MEALS
            
    #### SEMI-STATIC PAGES



    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
