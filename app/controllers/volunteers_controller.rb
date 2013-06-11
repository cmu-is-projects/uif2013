class VolunteersController < ApplicationController
  # GET /volunteers
  # GET /volunteers.json
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
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @volunteer }
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
end
