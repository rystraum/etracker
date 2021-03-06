class UnitsController < ApplicationController
  # GET /units
  # GET /units.json
  def index
    @unit = Unit.new
    @units = Unit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @units }
    end
  end

  # GET /units/1
  # GET /units/1.json
  def show
    @unit = Unit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @unit }
    end
  end

  # GET /units/new
  # GET /units/new.json
  def new
    @unit = Unit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @unit }
    end
  end

  # GET /units/1/edit
  def edit
    @unit = Unit.find(params[:id])
  end

  # POST /units
  # POST /units.json
  def create
    @unit = Unit.new(params[:unit])

    respond_to do |format|
      if @unit.save
        format.html { redirect_to @unit, notice: 'Unit was successfully created.' }
        format.json { render json: @unit, status: :created, location: @unit }
      else
        format.html { render action: "new" }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /units/1
  # PUT /units/1.json
  def update
    @unit = Unit.find(params[:id])

    respond_to do |format|
      if @unit.update_attributes(params[:unit])
        if params[:commit] == "Save"
          format.html { redirect_to @unit, notice: '<div class="alert alert-success">Unit was successfully updated.</div>' }
        else
          newL = Log.create(:unit_id => @unit.id, :user_id => current_user, :status => @unit.status_invert)
          format.html {
            redirect_to "/search", notice: "<div class='alert alert-success'>Unit was successfully #{@unit.status_label}</div>"
          }
          format.json { head :no_content }
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /units/1
  # DELETE /units/1.json
  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy

    respond_to do |format|
      format.html { redirect_to units_url }
      format.json { head :no_content }
    end
  end
  def barcodes_available
    @unit = Unit.new
    @units = Unit.unassigned
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "barcodes_available.pdf", :layout => "pdf.html"
      end
    end
  end

  def barcode_generate
    if params[:post][:quantity].present?
      (1..params[:post][:quantity].to_i).each do |n|
        Unit.create()
      end
    end
    redirect_to "/available_barcode"
  end
end

