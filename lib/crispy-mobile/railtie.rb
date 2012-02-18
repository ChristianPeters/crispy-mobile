require 'wurfl-lite-middleware'

module CrispyMobile
  class Railtie < Rails::Railtie
    initializer "crispy_mobile.use_middleware" do |app|
      app.middleware.use WURFL::Middleware
    end
  end
end
