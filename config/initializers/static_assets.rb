initializer "static assets" do |app|
  app.middleware.insert_before ::Rack::Lock, ::ActionDispatch::Static, "#{root}/app/assets"
end