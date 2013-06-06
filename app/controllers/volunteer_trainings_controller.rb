class VolunteerTrainingsController < ApplicationController
    #before_filter :check_login
    # GET /volunteer_trainings
    # GET /volunteer_trainings.json
    before_filter :authenticate_user!
    def index
        @volunteer_trainings = VolunteerTraining.all
        
        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @volunteer_trainings }
        end
    end
    
    # GET /volunteer_trainings/1
    # GET /volunteer_trainings/1.json
    def show
        @volunteer_training = VolunteerTraining.find(params[:id])
        
        respond_to do |format|
            format.html # show.html.erb
            format.json { render json: @volunteer_training }
        end
    end
    
    # GET /volunteer_trainings/new
    # GET /volunteer_trainings/new.json
    def new
        @volunteer_training = VolunteerTraining.new
        
        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @volunteer_training }
        end
    end
    
    # GET /volunteer_trainings/1/edit
    def edit
        @volunteer_training = VolunteerTraining.find(params[:id])
    end
    
    # POST /volunteer_trainings
    # POST /volunteer_trainings.json
    def create

        @volunteer_training = VolunteerTraining.new(params[:volunteer_training])
        if @volunteer_training.save
            # if saved to database
            flash[:notice] = "Successfully created Volunteer Training."
            redirect_to @volunteer_training # go to show volunteer page
            else
            # return to the 'new' form
            render :action => 'new'
        end
    end
    
    # PUT /volunteer_trainings/1
    # PUT /volunteer_trainings/1.json
    def update
        @volunteer = VolunteerTraining.find(params[:id]).volunteer
        
        @volunteer_training = Volunteer_training.find(params[:id])
        if @volunteer_training.update_attributes(params[:volunteer_training])
            flash[:notice] = "Successfully updated volunteer_training."
            redirect_to @volunteer
            else
            render :action => 'edit'
        end
    end
    
    # DELETE /volunteer_trainings/1
    # DELETE /volunteer_trainings/1.json
    def destroy
        @volunteer_training = VolunteerTraining.find(params[:id])
        @volunteer_training.destroy
        flash[:notice] = "Successfully removed volunteer_training from the UIF system."
        redirect_to volunteer_trainings_url
    end
end
