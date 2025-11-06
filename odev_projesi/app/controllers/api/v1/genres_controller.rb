class Api::V1::GenresController < ApplicationController
  
  # GET /api/v1/genres
  def index
    @genres = Genre.all
    render json: @genres
  end

  # GET /api/v1/genres/1
  def show
    @genre = Genre.find(params[:id])
    render json: @genre
  end
end