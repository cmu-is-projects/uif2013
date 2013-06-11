class VolunteersController < ApplicationController
  # GET /volunteers
  # GET /volunteers.json
  autocomplete :student, :first_name, :scopes => [:search_by_name], :display_value => :name, :extra_data => [:first_name, :last_name]
  
  def get_items(parameters)
     super(parameters)
     items = Student.search_by_name(params[:term])
  end

  def index
    @volunteers = Volunteer.alphabetical
    @pending_checks = VolunteerCheck.pending

    @query = Volunteer.search(params[:query])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @volunteers }
    end
  end

  # GET /volunteers/1
  # GET /volunteers/1.json
  def show
    @volunteer = Volunteer.find(params[:id])
    @notes = @volunteer.notes.by_priority
    @notable = @volunteer
    @shifts = @volunteer.shifts
    @trainings = @volunteer.trainings.alphabetical
    @volunteer_checks = @volunteer.volunteer_checks
    @volunteer_trainings = @volunteer.volunteer_trainings
    @checks = @volunteer.checks.alphabetical
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @volunteer }
    end
  end

  # GET /volunteers/new
  # GET /volunteers/new.json
  def new
    @volunteer = Volunteer.new
    if params[:term]
      @students = Student.search_by_name(params[:term])
    else
      @students = Student.all
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @volunteer }
      format.json { render json: @student.to_json }
    end
  end

  # GET /volunteers/1/edit
  def edit
    @volunteer = Volunteer.find(params[:id])
  end

  # POST /volunteers
  # POST /volunteers.json
  def create
    if !params[:volunteer][:household_attributes].nil?
      @household = params[:volunteer][:household_attributes]
    end
    params[:volunteer].delete "household_attributes"

    @volunteer = Volunteer.new(params[:volunteer])
    @household = Household.new(params[:household])
    if !@volunteer.student_id.blank?
      @student = Student.find(@volunteer.student_id)
      @volunteer.first_name = @student.first_name
      @volunteer.last_name = @student.last_name
      @volunteer.household_id = @student.household_id
      @volunteer.is_male = @student.is_male
      @volunteer.date_of_birth = @student.date_of_birth
      @volunteer.cell_phone = @student.cell_phone
      @volunteer.can_text = @student.can_text
      @volunteer.email = @student.email
      @volunteer.avatar = @student.avatar
    end
    respond_to do |format|
      if @volunteer.save and @household.save
        @volunteer.update_attributes({:household_id => @household.id})         
        format.html { redirect_to @volunteer, notice: 'A volunteer was successfully created.' }
        format.json { render json: @volunteer, status: :created, location: @volunteer }
      elsif @household.save
        @destroy_household = Household.find_by_id(@household.id)
        @destroy_household.destroy
        format.html { render action: "new" }
        #format.json { render json: @student.errors, status: :unprocessable_entity } 
      elsif @volunteer.save
        format.html { redirect_to @volunteer, notice: 'Volunteer was successfully created.' }
        format.json { render json: @volunteer, status: :created, location: @volunteer }
      else
        format.html { render action: "new" }
        format.json { render json: @volunteer.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PUT /volunteers/1
  # PUT /volunteers/1.json
  def update
    @volunteer = Volunteer.find(params[:id])
    params[:volunteer].delete "household_attributes"
    @household = Household.new(params[:household])
    respond_to do |format|
      if @volunteer.update_attributes(params[:volunteer])
        format.html { redirect_to @volunteer, notice: 'Volunteer was successfully updated.' }
        format.json { head :no_content }
          if @household.save
            @volunteer.update_attributes({:household_id => @household.id})
          end
      else
        format.html { render action: "edit" }
        format.json { render json: @volunteer.errors, status: :unprocessable_entity }
          if @household.save
            @destroy_household = Household.find_by_id(@household.id)
            @destroy_household.destroy
          end
      end
    end
  end

  # DELETE /volunteers/1
  # DELETE /volunteers/1.json
  def destroy
    @volunteer = Volunteer.find(params[:id])
    @volunteer.destroy

    respond_to do |format|
      format.html { redirect_to volunteers_url }
      format.json { head :no_content }
    end
  end
  
  def students
    if !params[:date].nil?
      month = params[:date][:month]
      year = params[:date][:year]
      day = params[:date][:day]
      @student = ActiveRecord::Base.connection.execute('SELECT students.name AS student FROM "students" WHERE (EXTRACT(MONTH from date_of_birth)::int = '+month+' AND EXTRACT(YEAR from date)::int ='+year+' AND EXTRACT(DAY from date)::int ='+day+') ORDER BY student')
    end
  end
end
