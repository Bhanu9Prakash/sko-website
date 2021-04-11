class HousesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_house, only: %i[ show edit update destroy ]

  # GET /houses or /houses.json
  def index
    @houses = House.all
    authorize @houses
  end

  # GET /houses/1 or /houses/1.json
  def show
    authorize @house
  end

  # GET /houses/new
  def new
    @house = current_user.houses.build
    authorize @house
    @house.members.new
  end

  # GET /houses/1/edit
  def edit
    authorize @house
  end

  # POST /houses or /houses.json
  def create
    @house = current_user.houses.build(house_params)
    authorize @house
    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: "House was successfully created." }
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1 or /houses/1.json
  def update
    authorize @house
    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to @house, notice: "House was successfully updated." }
        format.json { render :show, status: :ok, location: @house }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1 or /houses/1.json
  def destroy
    authorize @house
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: "House was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def house_params
      params.require(:house).permit(:house_number, :contact_number, :source_of_income, :number_of_people_employed, :living_since, :average_income, :documents, members_attributes: [:id, :name, :gender, :age, :relation_with_head, :qualification, :_destroy])
    end
end
