Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer unless Rails.env.production?
    provider :github, '0730d7ce215e672fb3aa', '22dab567529260d18f25231883675fd7e2d9c53b'
end