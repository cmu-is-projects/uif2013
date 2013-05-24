FactoryGirl.define do
  factory :department do
    name "Peforming Arts"
    description "Programs for children interested in performing arts"
    active true
  end
    
  factory :program do
    association :department
    name "Choir"
    description "Choir is for those who love to sing"
    start_date 1.year.ago.to_date
    end_date nil
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
    grade 10
    barcode_number {"#{rand(12**12).to_s.rjust(12, '0')}".to_i}
    date_of_birth 16.years.ago.to_date
    is_male true
    email {"#{first_name.downcase}.#{last_name.downcase}@yahoo.com"}
    is_visitor false
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
   active true
  end

  factory :guardian do
    association :household
    first_name  "Larry"
    last_name "Smith"
    guardian_type 'Father'
    cell_phone "222-222-2222"
    email {"#{first_name.downcase}.#{last_name.downcase}@yahoo.com"}
    active  true
  end
end

  
