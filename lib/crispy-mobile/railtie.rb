require 'crispy-mobile/device_detection_middleware'

module CrispyMobile
  class Railtie < Rails::Railtie
    initializer "crispy_mobile.use_middleware" do |app|
      app.middleware.use Crispy::DeviceDetectionMiddleware
    end
  end
end
