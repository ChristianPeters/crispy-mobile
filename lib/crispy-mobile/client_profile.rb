require 'hashie'
require 'wurfl-lite'

module Crispy
  class ClientProfile < Hashie::Dash
    SUPPORTED_WIDTHS = {handheld_320: 320, handheld_640: 640, desktop: 950}
    PROFILE_PROPERTIES = [:width]

    property :user_agent

    def initialize(user_agent, hash_or_cookie_string = {})
      initialize_properties

      self.user_agent = user_agent
      super ClientProfile.hash_or_cookie_string_to_hash(hash_or_cookie_string)
    end

    def wurfl_profile
      return nil if user_agent.nil?
      @wurfl_profile ||= WURFL.new[user_agent]
    end

    def default_width
      wurfl_profile && wurfl_profile.resolution_width or SUPPORTED_WIDTHS[:desktop]
    end

    def to_cookie_string
      PROFILE_PROPERTIES.each.map {|prop| "#{prop}:#{self[prop]}"}.join(',')
    end

    private

    def initialize_properties
      PROFILE_PROPERTIES.each do |prop|
        if defined? "default_#{prop}"
          ClientProfile.property prop, default: proc { send("default_#{prop}") }
        else
          ClientProfile.property prop
        end
      end
    end

    def self.hash_or_cookie_string_to_hash(str_or_hash)
      if str_or_hash.is_a? String
        self.cookie_string_to_hash(str_or_hash)
      else
        str_or_hash
      end
    end

    def self.cookie_string_to_hash(str)
      key_value_pairs = str.split(',').map do |s|
        key_value_pair = s.split(':')
        begin
          key_value_pair[1] = Integer(key_value_pair[1])
        rescue ArgumentError
        end
        key_value_pair
      end
      Hash[*(key_value_pairs.flatten)]
    end

  end
end
