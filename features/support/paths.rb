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
    when /the new event page/
      new_event_path

    when /the event index page/
      events_path

    when /the Monday class page/
      event_path(@mon_class)
      
    when /the edit Monday class page/
      edit_event_path(@mon_class)



    #### HOUSEHOLDS
    when /the new household page/
      new_household_path

    when /the household index page/
      households_path

    when /the Smith page/
      household_path(@smith)

    when /the edit Smith page/
      edit_household_path(@smith)

    #### STUDENTS

    when /the new student page/
      new_student_path
      
    when /the student index page/
      students_path

    when /the Alex Heimann page/
      student_path(@alex)
      
    when /the edit Alex Heimann page/
      edit_student_path(@alex)
      
    when /the Stephany Park page/
      student_path(@stephany)
      
    when /the edit Stephany Park page/
      edit_student_path(@stephany)
      
    when /the Sean Scott page/
      student_path(@sean)
      
    when /the edit Sean Scott page/
      edit_student_path(@sean)
    
    #### GUARDIANS
    
    #### MEDICAL_CONDITIONS
    
    #### OTC_DRUGS

    when /the new drug page/
      new_drug_path
      
    when /the drug index page/
      drugs_path

    when /the Motrin page/
      drug_path(@motrin)
      
    when /the edit Motrin page/
      edit_drug_path(@motrin)
      
    when /the Ibuprofen page/
      drug_path(@ibuprofen)
      
    when /the edit Ibuprofen page/
      edit_drug_path(@ibuprofen)
      
    when /the Advil page/
      drug_path(@advil)
      
    when /the edit Advil page/
      edit_drug_path(@advil)

    
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
