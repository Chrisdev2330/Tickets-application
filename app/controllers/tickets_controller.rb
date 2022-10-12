class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy  ]

  # GET /tickets or /tickets.json
  def index
    if current_user.administrator?
      @tickets = Ticket.all   
    end

    if current_user.technical?
      @user = User.find(current_user.id)
      @technical = @user.technical
      @tickets = Ticket.where(technical_id: @technical.id ).or(Ticket.where(user_id: current_user.id))
    end

    if current_user.customer?
       @tickets = Ticket.where(user_id: current_user.id)
    end 
  end

  def edit_update
    @ticket = Ticket.find(params[:id])

    if @ticket.open?
      @ticket.status = 2
    elsif @ticket.attended?
      @ticket.status = 1
    else
      @ticket.status = 0
    end

    if @ticket.save
      redirect_to ticket_url(@ticket)
    end
  end

  
  # GET /tickets/1 or /tickets/1.json
  def show
    @techicals = Technical.all
    @user = User.find(@ticket.user_id)
    @technical = Technical.find(@ticket.technical_id)
    @building = Building.find(@ticket.building_id)
  end

  def update_technical
    @ticket = Ticket.find(params[:id])
    respond_to do |format|
      if @ticket.update(ticket_technical_params)
        format.html { redirect_to ticket_url(@ticket), notice: "Se ha asignado un nuevo tecnico" }
      else
        format.html { render :show, status: :unprocessable_entity }
      end
    end
  end
  

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    @buildings = Building.all
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets or /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user_id = current_user.id
    @user = User.find(current_user.id)
  
    if @user.technical?
      @technical = @user.technical
      @ticket.technical_id = @technical.id
    else
      @technical_id = Technical.order('RANDOM()').first 
      @ticket.technical_id = @technical_id.id
    end
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully created." }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to tickets_url, notice: "Ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:problem, :description, :building_id, :case, :level, :status)
    end

    def ticket_technical_params
      params.require(:ticket).permit(:technical_id)
    end
end
