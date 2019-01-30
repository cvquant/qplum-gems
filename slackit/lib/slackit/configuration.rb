module Slackit
  class Configuration

    attr_accessor :channels, :webhook_url, :default_sender, :default_color

    def initialize
      @channels = {}
      @default_sender = "Slackit"
      @default_color = "good"
    end

    def channels
      @channels ||= {}
    end

    def channels=(channel_names)
      @channels ||= {}
      channel_names.each do |channel_name|
        channel_name = clean_channel_name(channel_name)
        @channels[channel_name] ||= Channel.new(channel_name, @default_sender, @default_color)
      end
      Message.define_methods
    end

    def channel(channel_name)
      channel_name = clean_channel_name(channel_name.to_s)
      raise unless @channels.present? && @channels.key?(channel_name)
      yield(@channels[channel_name])
    end

    private

    def clean_channel_name(channel_name)
      channel_name = channel_name[1..-1] if channel_name.first == '#'
      channel_name.downcase
    end
  end
end
