module Slackit
  class Configuration

    attr_accessor :channels, :webhook_url, :default_sender, :default_color

    def initialize
      @channels = {}
      @default_sender = "Slackit"
      @default_color = "good"
    end

    def channels
      @channels
    end

    def channel(channel_name)
      clean_channel_name = Channel.clean_name(channel_name)
      @channels[clean_channel_name] ||= Channel.new(channel_name.to_s, @default_sender, @default_color)
      yield(@channels[clean_channel_name]) if block_given?
    end
  end
end
