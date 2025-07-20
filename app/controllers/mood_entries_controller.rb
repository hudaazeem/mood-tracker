class MoodEntriesController < ApplicationController
  before_action :set_mood_entry, only: %i[show edit update destroy]

  def index
    @mood_entries = MoodEntry.order(entry_date: :desc)
  end

  def show
  end

  def new
    @mood_entry = MoodEntry.new
  end


  def edit
    @mood_entry = MoodEntry.find(params[:id])
  end

  def create
  @mood_entry = MoodEntry.new(mood_entry_params)
    if @mood_entry.save
        redirect_to mood_entries_path, notice: "Mood entry saved!"
    else
        render :new, status: :unprocessable_entity
    end
  end


  def update
    if @mood_entry.update(mood_entry_params)
      redirect_to mood_entries_path, notice: "Mood entry was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @mood_entry = MoodEntry.find(params[:id])
    @mood_entry.destroy
    redirect_to mood_entries_path, notice: "Mood entry was successfully deleted."
  end




  private

  def set_mood_entry
    @mood_entry = MoodEntry.find(params[:id])
  end


  def mood_entry_params
    params.require(:mood_entry).permit(:entry_date, :mood, :note)
  end
end
