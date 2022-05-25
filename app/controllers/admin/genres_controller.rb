class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!


  def create
    @genres = Genre.all
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end

  def index
    @genres = Genre.all
    # @genre = Genre.new(genre_params)
  end

  def edit
    @genre = Genre.find(params[:id])

  end

  def update

  end

  private

  def genre_params
    params.permit(:name)
  end

end
