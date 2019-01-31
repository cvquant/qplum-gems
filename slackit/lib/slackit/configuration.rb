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
      channel_name = clean_channel_name(channel_name.to_s)
      @channels[channel_name] ||= Channel.new(channel_name, @default_sender, @default_color)
      yield(@channels[channel_name]) if block_given?
    end

    private

    def clean_channel_name(channel_name)
      channel_name = channel_name[1..-1] if channel_name.first == '#'
      channel_name.downcase
    end
  end
end
