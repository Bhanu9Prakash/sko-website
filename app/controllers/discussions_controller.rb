class DiscussionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_discussion, only: %i[ show edit update destroy ]

  # GET /discussions or /discussions.json
  def index
    @m = Discussion.ransack(params[:q])
    @discussions = @m.result(distinct: true)
  end

  # GET /discussions/1 or /discussions/1.json
  def show
  end

  # GET /discussions/new
  def new
    
    @discussion = current_user.discussions.build
    authorize @discussion
  end

  # GET /discussions/1/edit
  def edit
    authorize @discussion
  end

  # POST /discussions or /discussions.json
  def create
    
    @discussion = current_user.discussions.build(discussion_params)
    authorize @discussion
    respond_to do |format|
      if @discussion.save
        format.html { redirect_to @discussion, notice: "Discussion was successfully created." }
        format.json { render :show, status: :created, location: @discussion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discussions/1 or /discussions/1.json
  def update
    authorize @discussion
    respond_to do |format|
      if @discussion.update(discussion_params)
        format.html { redirect_to @discussion, notice: "Discussion was successfully updated." }
        format.json { render :show, status: :ok, location: @discussion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussions/1 or /discussions/1.json
  def destroy
    #authorize @discussion
    @discussion.destroy
    respond_to do |format|
      format.html { redirect_to discussions_url, notice: "Discussion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discussion
      @discussion = Discussion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def discussion_params
      params.require(:discussion).permit(:title, :description)
    end
end
