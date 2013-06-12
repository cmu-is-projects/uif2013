class DrugsController < ApplicationController

  # GET /drugs
  # GET /drugs.json
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user!

  # respond_to :html, :json, :js, :xml
  # def ajax_drugs
  #   puts params
  #   @drug = Drug.new
  #   @drug.name = params[:name]
  #   @drug.description = params[:description]

  #   respond_to do |format|
  #     if @drug.save
  #       format.html { redirect_to @drug, notice: 'Drug was successfully created.' }
  #       format.json { render json: @drug, status: :created, location: @drug }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @drug.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  
  def index
    @drugs = Drug.alphabetical.paginate(:page => params[:page], :per_page => 5)
    # @current_drugs = Drug.active.alphabetical.paginate(:page => params[:page], :per_page => 5)
    # @past_drugs = Drug.inactive.alphabetical.paginate(:page => params[:page], :per_page => 5)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @drugs }
    end
  end

  # GET /drugs/1
  # GET /drugs/1.json
  def show
    @drug = Drug.find(params[:id])
    @notes = @drug.notes.by_priority
    @notable = @drug

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @drug }
    end
  end

  # GET /drugs/new
  # GET /drugs/new.json
  def new
    @drug = Drug.new
    @data = params[:data]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @drug }
    end
  end

  # GET /drugs/1/edit
  def edit
    @drug = Drug.find(params[:id])
  end

  # POST /drugs
  # POST /drugs.json
  def create
    @drug = Drug.new(params[:drug])
    #respond_with Allergy.create(params[:allergy])
    respond_to do |format|
      if @drug.save
        format.html { redirect_to @drug, notice: 'Drug was successfully created.' }
        format.json { render json: @drug, status: :created, location: @drug }
      else
        format.html { render action: "new" }
        format.json { render json: @drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /drugs/1
  # PUT /drugs/1.json
  def update
    @drug = Drug.find(params[:id])
    respond_to do |format|
      if @drug.update_attributes(params[:drug])
        format.html { redirect_to @drug, notice: 'Drug was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drugs/1
  # DELETE /drugs/1.json
  def destroy
    @drug = Drug.find(params[:id])
    @drug.destroy

    respond_to do |format|
      format.html { redirect_to drugs_url }
      format.json { head :no_content }
    end
  end
end
