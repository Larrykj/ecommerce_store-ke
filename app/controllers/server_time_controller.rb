class ServerTimeController < ApplicationController
  def show
    render json: { server_time: Time.current }
  end
end
