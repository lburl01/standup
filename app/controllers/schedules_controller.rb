class SchedulesController < ApplicationController

  # CLIENT_SECRETS_PATH = 'app/controllers/client_secrets.json'

  def configure_client(current_user)
    # client_secrets = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
    # @client = Google::APIClient.new
    @client.authorization.access_token = current_user.oauth_token
    @client.authorization.expires_at = current_user.oauth_expires_at
    @client.authorization.refresh_token = current_user.refresh_token
    @client.authorization.client_id = ENV['GOOGLE_CLIENT_ID']
    @client.authorization.client_secret = ENV['GOOGLE_CLIENT_SECRET']
    if current_user.oauth_expires_at > Time.now
      @client.fetch_access_token!
    end
  end

  def get_10_events
    # configure_client(current_user)
    calendar = Google::Apis::CalendarV3::CalendarService.new
    calendar.authorization = @client
    render json: calendar.get_calendar('primary')
  end

end
