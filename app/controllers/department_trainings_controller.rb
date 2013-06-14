class DepartmentTrainingsController < ApplicationController
    #before_filter :check_login
    # GET /department_trainings
    # GET /department_trainings.json
    before_filter :authenticate_user!
    def index
        @department_trainings = DepartmentTraining.all
        
        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @department_trainings }
        end
    end
    
    # GET /department_trainings/1
    # GET /department_trainings/1.json
    def show
        @department_training = DepartmentTraining.find(params[:id])
        
        respond_to do |format|
            format.html # show.html.erb
            format.json { render json: @department_training }
        end
    end
    
    # GET /department_trainings/new
    # GET /department_trainings/new.json
    def new
        @department_training = DepartmentTraining.new
        
        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @department_training }
        end
    end
    
    # GET /department_trainings/1/edit
    def edit
        @department_training = DepartmentTraining.find(params[:id])
    end
    
    # POST /department_trainings
    # POST /department_trainings.json
    def create

        @department_training = DepartmentTraining.new(params[:department_training])
        @department = @department_training.department

        if @department_training.save
            # if saved to database
            flash[:notice] = "Successfully created Department Training."
            redirect_to @department # go to show department page
            else
            # return to the 'new' form
            render :action => 'new'
        end
    end
    
    # PUT /department_trainings/1
    # PUT /department_trainings/1.json
    def update
        @department_training = DepartmentTraining.find(params[:id])
        @training = @department_training.training
        respond_to do |format|
            if @department_training.update_attributes(params[:department_training])
                format.html { redirect_to @training, notice: 'Department Training was successfully updated.' }
                format.json { head :no_content }
                else
                format.html { render action: "edit" }
                format.json { render json: @department_training.errors, status: :unprocessable_entity }
            end
        end
    end
    
    # DELETE /department_trainings/1
    # DELETE /department_trainings/1.json
    def destroy
        @department_training = DepartmentTraining.find(params[:id])
        @training = @department_training.training

        @department_training.destroy
        flash[:notice] = "Successfully removed department_training from the UIF system."
        redirect_to @training
    end
end
