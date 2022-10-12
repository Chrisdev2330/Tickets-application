class TechnicalsController < ApplicationController
  before_action :set_technical, only: %i[ show edit update destroy ]

  # GET /technicals or /technicals.json
  def index
    @technicals = Technical.all
  end

  # GET /technicals/1 or /technicals/1.json
  def show
  end

  # GET /technicals/new
  def new_technical
    @technical = Technical.new 
    @user = User.find(params[:id])    
  end

  def create_technical
    @user = User.find(params[:id])
    @technical = Technical.new(technical_params)
    @technical.user_id = @user.id
    respond_to do |format|
      if @technical.save
        format.html { redirect_to technical_path(@technical), notice: "Technical was successfully created." }
        format.json { render :show, status: :created, location: @technical }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @technical.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    
  end
  

  # PATCH/PUT /technicals/1 or /technicals/1.json
  def update
    respond_to do |format|
      if @technical.update(technical_params)
        format.html { redirect_to technical_url(@technical), notice: "Technical was successfully updated." }
        format.json { render :show, status: :ok, location: @technical }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @technical.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /technicals/1 or /technicals/1.json
  def destroy
    @technical.destroy

    respond_to do |format|
      format.html { redirect_to technicals_url, notice: "Technical was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_technical
      @technical = Technical.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def technical_params
      params.require(:technical).permit(:name, :lastname, :phone, :address)
    end
end
