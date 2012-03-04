require 'wurfl-lite'

module Crispy
  class DeviceDetectionMiddleware

    def initialize(app)
      @app = app
      @wurfl = WURFL.new
    end

    def call(env)
      env['WURFL'] = @wurfl[env['HTTP_USER_AGENT']]
      @app.call env
    end

  end
end
