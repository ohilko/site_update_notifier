CLIENT_ID= '144604346759.apps.googleusercontent.com'
CLIENT_SECRET= '7uTPw0Ug08k2epi7774zWmZY'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, CLIENT_ID, CLIENT_SECRET, {
    access_type: 'offline',
    scope: 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile',
    redirect_uri:'http://localhost:3000/auth/google_oauth2/callback'
  }

  provider :identity, on_failed_registration: lambda { |env|
    IdentitiesController.action(:new).call(env)
  }
end