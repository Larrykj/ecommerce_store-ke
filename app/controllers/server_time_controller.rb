# ServerTimeController - Returns the current server time as JSON
#
# This controller provides a simple API endpoint to retrieve the server's
# current time. Useful for client-server time synchronization and debugging.
#
# Endpoint: GET /server_time
# Response: { "server_time": "2026-01-30 18:41:45 +0300" }
#
# Author: Larrykj
# Last Updated: 2026-01-30
class ServerTimeController < ApplicationController
  # GET /server_time
  # Returns the current server time in JSON format
  # Uses Time.current which respects Rails' configured timezone
  def show
    render json: { server_time: Time.current }
  end
end
