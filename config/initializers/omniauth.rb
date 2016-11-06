Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], {
    redirect_uri:"http://localhost:3001/auth/google_oauth2/callback",
    prompt: "consent",
    scope: "email, profile, calendar"
  }
end
