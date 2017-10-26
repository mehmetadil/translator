class LanguagesController < ApplicationController
  before_action :set_language, only: %i[show edit update destroy]

  def index
    @languages = Language.all
  end

  def show; end

  def new
    @language = Language.new
  end

  def create
    @language = Language.new(language_params)

    if @language.save
      redirect_to languages_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @language.update_attributes(language_params)
      redirect_to language_path(@language)
    else
      render :edit
    end
  end

  def destroy
    @language.destroy
    redirect_to languages_path
  end

  private

  def language_params
    params.require(:language).permit(:name)
  end

  def set_language
    @language = Language.find(params[:id])
  end
end
