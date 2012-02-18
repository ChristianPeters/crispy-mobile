module Crispy

  class Device
    include Comparable

    attr_accessor :profile
    attr_accessor :display_width

    SUPPORTED_DISPLAY_WIDTHS = {handheld_320: 320, handheld_640: 640, desktop: 950}

    def initialize(profile)
      self.profile = profile
      self.display_width = profile.resolution_width
    end

    def to_s
      profile[:id]
    end

    def <=>(other)
      raise "Comparison of devices failed. Tried to compare #{self} with nil." if other.nil?

      other_width = if other.respond_to? :display_width
        other.display_width
      elsif other.respond_to?(:to_i) && other.to_i.integer?
        other.to_i
      elsif SUPPORTED_DISPLAY_WIDTHS.has_key? other
        SUPPORTED_DISPLAY_WIDTHS[other]
      end

      raise "Comparison of devices failed. No valid display_width can be infered from #{other}." unless other_width && other_width > 0
      display_width <=> other_width
    end
  end

  class DesktopDevice < Device
    def initialize(profile = WURFL::Hash.new)
      profile.reverse_merge! resolution_width: display_width, id: 'desktop'
      super(profile)
    end

    def display_width
      SUPPORTED_DISPLAY_WIDTHS[:desktop] || 1024
    end
  end

end
