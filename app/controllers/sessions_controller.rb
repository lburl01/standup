class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token


  def create
    @auth = env["omniauth.auth"]
    if User.exists?(email: @auth.info.email)
      user = User.find(email: @auth.info.email)
      session[:user_id] = user.id
    else
      @user = User.from_omniauth(@auth)
      session[:user_id] = @user.id
    end
    redirect_to bulbs_index_path
  end
end

# def create
#     #What data comes back from OmniAuth?
#     @auth = request.env["omniauth.auth"]
#     #Use the token from the data to request a list of calendars
#     @token = @auth["credentials"]["token"]
#     client = Google::APIClient.new
#     client.authorization.access_token = @token
#     service = client.discovered_api('calendar', 'v3')
#     @result = client.execute(
#       :api_method => service.calendar_list.list,
#       :parameters => {},
#       :headers => {'Content-Type' => 'application/json'})
#   end

# auth_client.code = auth_code
# auth_client.fetch_access_token!
