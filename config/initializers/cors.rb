Rails.application.middleware.insert_before 0, Rack::Cors do
  allow do
     origins '*'
     resource '/servers.js', headers: :any, methods: :any
  end
end
