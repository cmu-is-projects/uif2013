Uif2013::Application.routes.draw do
  resources :shifts


  get "check/edit"

  get "check/index"

  get "check/new"

  get "check/show"

  get "training/index"

  get "training/show"

  resources :trainings  
  resources :checks
  resources :shifts
  resources :department_trainings
  resources :volunteer_trainings
  resources :volunteer_checks
  resources :notes

  #require 'api_constraints' 
  
  # Barcode scanning routes
  match 'checkin', :controller => 'home', :action => 'checkin', :as => :checkin
  match 'volunteer_checkin', :controller => 'home', :action => 'volunteer_checkin', :as => :volunteer_checkin
  match 'meals_served', :controller => 'event', :action => 'meals_served'
  
  # General Home
  match 'home' => 'home#index', :as => :home
  match 'about' => 'home#about', :as => :about
  match 'contact' => 'home#contact', :as => :contact
  match 'privacy' => 'home#privacy', :as => :privacy
  match 'search' => 'home#search', :as => :search
  match 'statistics' => 'home#statistics', :as => :statistics
  
  # mobile routes
  resources :tokens,:only => [:create, :destroy]
  match 'getToken' => 'tokens#create', :via => :post
  match 'destroyToken' => 'tokens#destroy', :via => :delete
  match 'ajax_allergies' => 'allergies#ajax_allergies', :via => :get
  match 'getTodaysEvents' => 'mobile#getTodaysEvents', :via => :get
  match 'createAttendances' => 'mobile#createAttendances', :via => :post
  match 'getPhoto' => 'mobile#getPhoto', :via => :post
  match 'searchForStudent' => 'mobile#searchForStudent', :via => :get
  match 'getProgramsAndSections' => 'mobile#getProgramsAndSections', :via => :get
  match 'createEvent' => 'mobile#createEvent', :via => :post
  
  # Notes
  match 'alerts' => 'notes#alerts', :as => :alerts
  match 'dismiss_note/:id' => 'notes#dismiss', :as => :dismiss_note
  
  # Special attendance routes
  match 'mark_attended/:id' => 'events#mark_attended', :as => :mark_attended
  match 'mark_absent/:id' => 'events#mark_absent', :as => :mark_absent
  

  #Generated model routes
  resources :allergies
  resources :guardians do
    resources :notes
  end
  resources :student_allergies
  resources :households do 
    resources :notes
  end
  resources :students do
    resources :notes
    get 'id', :on => :member
  end
  resources :sections
  resources :attendances
  resources :locations do
    resources :notes
  end
  resources :events do
    resources :notes
    resources :shifts
    get 'meals_served', :on => :member
    get 'barcodes', :on => :member
  end
  resources :programs do
    resources :notes
    resources :shifts
  end
  resources :departments
  resources :enrollments
  resources :section_events
  #match 'volunteers/autocomplete_student_first_name' => 'volunteers#autocomplete_student_first_name'
  resources :volunteers do
    get :autocomplete_student_first_name, :on => :collection
    resources :notes
  end
  resources :trainings do
    resources:notes
  end
  resources :checks
  
  # Default URL
  root :to => 'home#index'
  
  # Authentication routes
  # resources :users
  devise_for :users
  # resources :sessions
  # match 'register' => 'users#new', :as => :register
  # match 'logout' => 'sessions#destroy', :as => :logout
  # match 'login' => 'sessions#new', :as => :login

end
