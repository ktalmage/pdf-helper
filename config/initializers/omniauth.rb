Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer unless Rails.env.production?
    provider :github, '96e5eb3fa9aa426a5c76', '620bfd35edfce911573e8c901d6820acf21afd41'
end