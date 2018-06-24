Rails.application.config.middleware.insert_before(0, Rack::Cors) do
  allow do
    origins 'open-source.static.tapenvy.us'
    resource '*', headers: :any, methods: %i(get)
  end

  allow do
    origins 'megamek.org'
    resource '*', headers: :any, methods: %i(get post patch delete put)
  end

  allow do
    origins 'api.megamek.org'
    resource '*', headers: :any, methods: %i(get post patch delete put)
  end
end
