class SchedulesController < ApplicationController

  CLIENT_SECRETS_PATH = 'app/controllers/client_secrets.json'

  def configure_client(current_user)
    @client_secrets = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
    # @client = Google::APIClient.new
    # @client.authorization.access_token = current_user.oauth_token
    # @client.authorization.expires_at = current_user.oauth_expires_at
    # @client.authorization.refresh_token = current_user.refresh_token
    # @client.authorization.client_id = ENV['GOOGLE_CLIENT_ID']
    # @client.authorization.client_secret = ENV['GOOGLE_CLIENT_SECRET']
    # if @client.authorization.refresh_token && @client.authorization.expired?
    #   @client.authorization.fetch_access_token!
    # end
  end

  def get_10_events
    @client_secrets = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
    calendar = Google::Apis::CalendarV3::CalendarService.new
    authorization = @client_secrets.to_authorization
    authorization.scope = 'https://www.googleapis.com/auth/calendar'
    binding.pry
    # calendar.authorization =
    # render json: calendar.get_calendar('primary')
    render :index
  end

end
