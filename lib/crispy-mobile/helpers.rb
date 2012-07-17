module Crispy

  module DeviceHelpers

    def device
      if request.env['WURFL'].nil?
        @device ||= DesktopDevice.new
      else
        @device ||= Device.new(request.env['WURFL'])
      end
    end

    if defined?(ActiveSupport)
      ActiveSupport.on_load(:action_controller) do
        helper_method :device
      end
    end

  end

end
