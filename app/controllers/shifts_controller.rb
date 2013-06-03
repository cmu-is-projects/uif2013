class ShiftsController < ApplicationController
  # GET /shifts
  # GET /shifts.json
  def index
    @shifts = Shift.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shifts }
    end
  end

  # GET /shifts/1
  # GET /shifts/1.json
  def show
    @shift = Shift.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shift }
    end
  end

  # GET /shifts/new
  # GET /shifts/new.json
  def new
    @shift = Shift.new
    unless params[:id].nil? || params[:source].nil?
      @klass = params[:source]
      @klass_id = params[:id]
      if params[:source] == 'volunteer'
        volunteer = Volunteer.find(params[:id])
        @note_focus = volunteer.proper_name
      else
        @note_focus = 'Event'
      end
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shift }
    end
  end

  # GET /shifts/1/edit
  def edit
    @shift = Shift.find(params[:id])
  end

  # POST /shifts
  # POST /shifts.json
  def create
    @shiftable = find_shiftable
    @shift = @shiftable.shifts.build(params[:shift])
    if @shift.save
      flash[:notice] = "Successfully created note."
      noting_on = @shift.shiftable_type.pluralize
      id = @shift.shiftable_id
      # b/c of asset pipeline we will simply use the following eval hack (quick and painless):
      eval "redirect_to #{@shift.shiftable_type.downcase}_path(:id=>#{id})"
    else
      render :action => 'new'
    end
    #respond_to do |format|
    #  if @shift.save
    #    format.html { redirect_to @shift, notice: 'Shift was successfully created.' }
    #    format.json { render json: @shift, status: :created, location: @shift }
    #  else
    #    format.html { render action: "new" }
    #    format.json { render json: @shift.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # PUT /shifts/1
  # PUT /shifts/1.json
  def update
    @shift = Shift.find(params[:id])

    respond_to do |format|
      if @shift.update_attributes(params[:shift])
        format.html { redirect_to @shift, notice: 'Shift was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shifts/1
  # DELETE /shifts/1.json
  def destroy
    @shift = Shift.find(params[:id])
    @shift.destroy

    respond_to do |format|
      format.html { redirect_to shifts_url }
      format.json { head :no_content }
    end
  end
end
  
  private
  def find_shiftable
    if params[:shift][:hidden_klass] && params[:shift][:hidden_id]
      return params[:shift][:hidden_klass].classify.constantize.find(params[:shift][:hidden_id])
    else
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
    end
    nil
  end
