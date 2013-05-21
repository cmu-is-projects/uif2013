
FactoryGirl.define do
  factory :department do
    name "Peforming Arts"
    description "Programs for children interested in performing arts"
    active true
  end
    
  factory :program do
    association :department
    name "Choir"
    description "Children who sing"
    start_date 1.year.ago.to_date
    end_date 1.month.ago.to_date
    max_capacity 60
    max_grade 12
    min_grade 6
    active true
  end
  
  factory :section do
    association :program
    name "HS Choir"
    max_capacity 20
    active true
  end

  factory :enrollment do
    association :student
    association :section
  end
  
   factory :location do
    name "CMU"
    street "5000 Forbes Avenue"
    city "Pittsburgh"
    zip "15213"
    active true
  end
  
  factory :event do
    association :program
    association :location
    date Date.today
    start_time Time.local(2012,10,6,11,0,0)
    end_time Time.local(2012,10,6,14,0,0)
    meals_served 100
    gospel_shared true
    bibles_distributed true
  end
  
  factory :student do
    association :household
    first_name "Alexander"
    last_name "Heimann"
    grade 20
    date_of_birth "3/20/88"
    is_male false
    email "G3ptballer22@yahoo.com"
    household_id 123456
  end
  
  factory :attendance do
    association :event
    association :student
    exempt true
  end

  factory :household do
   name "Smith"
   street "1212 Morewood Avenue"
   city "Pittsburgh"
   zip "15213"
   insurance_company "United Healthcare"
  end

  factory :guardian do
    association :household
    first_name  "Larry"
    last_name "Smith"
    guardian_type 'Father'
    active  true
  end
end

  
