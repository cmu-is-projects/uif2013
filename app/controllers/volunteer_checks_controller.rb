class VolunteerChecksController < ApplicationController
    #before_filter :check_login
    # GET /volunteer_checks
    # GET /volunteer_checks.json
    before_filter :authenticate_user!
    def index
        @volunteer_checks = VolunteerCheck.all
        
        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @volunteer_checks }
        end
    end
    
    # GET /volunteer_checks/1
    # GET /volunteer_checks/1.json
    def show
        @volunteer_check = VolunteerCheck.find(params[:id])
        
        respond_to do |format|
            format.html # show.html.erb
            format.json { render json: @volunteer_check }
        end
    end
    
    # GET /volunteer_checks/new
    # GET /volunteer_checks/new.json
    def new
        @volunteer_check = VolunteerCheck.new
        
        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @volunteer_check }
        end
    end
    
    # GET /volunteer_checks/1/edit
    def edit
        @volunteer_check = VolunteerCheck.find(params[:id])
    end
    
    # POST /volunteer_checks
    # POST /volunteer_checks.json
    def create

        @volunteer_check = VolunteerCheck.new(params[:volunteer_check])
        @volunteer = @volunteer_check.volunteer

        if @volunteer_check.save
            # if saved to database
            flash[:notice] = "Successfully created Volunteer Check."
            redirect_to @volunteer # go to show volunteer page
            else
            # return to the 'new' form
            render :action => 'new'
        end
    end
    
    # PUT /volunteer_checks/1
    # PUT /volunteer_checks/1.json
    def update
        @volunteer = VolunteerCheck.find(params[:id]).volunteer
        
        @volunteer_check = Volunteer_check.find(params[:id])
        if @volunteer_check.update_attributes(params[:volunteer_check])
            flash[:notice] = "Successfully updated volunteer_check."
            redirect_to @volunteer
            else
            render :action => 'edit'
        end
    end
    
    # DELETE /volunteer_checks/1
    # DELETE /volunteer_checks/1.json
    def destroy
        @volunteer_check = VolunteerCheck.find(params[:id])
        @volunteer_check.destroy
        flash[:notice] = "Successfully removed volunteer_check from the UIF system."
        redirect_to volunteer_checks_url
    end
end
