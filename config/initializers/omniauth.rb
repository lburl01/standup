Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], {
    redirect_uri: "/auth/google_oauth2/callback",
    scope: "email, profile, calendar"
  }
end
