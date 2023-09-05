class PitchesController < ApplicationController
  before_action :set_pitch, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @pitches = Pitch.all
    @pitches = Pitch.search_pitches(params[:query]) if params[:query].present?
  end

  def show
    @pitch = Pitch.find(params[:id])
    @pitches_users = Pitch.where(pitch_id: @pitch.id)
    @pitches_count = Pitch.where(user_id: current_user.id, id: @pitch.id).count
    # @pitches_approved = Pitch.where(status: true, id: @pitch.id).count
  end


  # GET /pitches/new
  def new
    @pitch = Pitch.new
  end

  # GET /pitches/1/edit
  def edit
  end

  # POST /pitches
  def create
    @pitch = Pitch.new(pitch_params)
    @pitch.user_id = current_user.id

    if @pitch.save
      redirect_to @pitch, notice: "Pitch was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pitches/1
  def update
    if @pitch.update(pitch_params)
      redirect_to @pitch, notice: "Pitch was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /pitches/1
  def destroy
    @pitch.destroy
    redirect_to pets_url, notice: "Pitch was successfully destroyed.", status: :see_other
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pitch
    @pitch = Pitch.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pitch_params
    params.require(:pitch).permit(:title, :languages, :category, :description, :source)
  end
end
