class Api::V1::AuthorsController < ApplicationController
  
  # GET /api/v1/authors
  def index
    @authors = Author.all
    render json: @authors
  end

  # GET /api/v1/authors/1
  def show
    @author = Author.find(params[:id])
    render json: @author
  end
end