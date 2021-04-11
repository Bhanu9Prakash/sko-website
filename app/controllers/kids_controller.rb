class KidsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_kid, only: %i[ show edit update destroy ]

  # GET /kids or /kids.json
  def index
    @q = Kid.ransack(params[:q])
    @kids = @q.result(distinct: true)
    authorize @kids
  end

  # GET /kids/1 or /kids/1.json
  def show
    authorize @kid
  end

  # GET /kids/new
  def new
    
    @kid = current_user.kids.build
    authorize @kid
  end

  # GET /kids/1/edit
  def edit
    authorize @kid
  end

  # POST /kids or /kids.json
  def create
    @kid = current_user.kids.build(kid_params)
    authorize @kid
    respond_to do |format|
      if @kid.save
        format.html { redirect_to @kid, notice: "Kid was successfully created." }
        format.json { render :show, status: :created, location: @kid }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kids/1 or /kids/1.json
  def update
    authorize @kid
    respond_to do |format|
      if @kid.update(kid_params)
        format.html { redirect_to @kid, notice: "Kid was successfully updated." }
        format.json { render :show, status: :ok, location: @kid }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kids/1 or /kids/1.json
  def destroy
    authorize @kid
    @kid.destroy
    respond_to do |format|
      format.html { redirect_to kids_url, notice: "Kid was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kid
      @kid = Kid.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kid_params
      params.require(:kid).permit(:name, :age, :current_standard, :school, :medium, :home_address, :mobile, :caste, :father_name, :father_occupation, :mother_name, :mother_occupation, :annual_income, :extra_curriculars, :personality_trait, :remarks, :additional_info, :house_id)
    end
end
