class Api::V1::GreetingsController < ApplicationController
  def show
    render json: { message: "Hello " }
  end
end
