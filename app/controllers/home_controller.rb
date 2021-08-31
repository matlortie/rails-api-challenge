class HomeController < ApplicationController
  def index
    render json: {status: 'up and running'}
  end
end