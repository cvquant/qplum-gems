module Slackit
  class Channel

    attr_accessor :channel_name, :default_color, :default_sender

    def initialize(channel_name, default_sender, default_color)
      @channel_name = channel_name
      @default_color = default_color
      @default_sender = default_sender
    end

    def send_to_channel(attachment, sender)
      attachment[:color] ||= @default_color
      notifier(sender).ping '', attachments: [attachment]
    end

    def self.clean_name(channel_name)
      channel_name = channel_name.to_s
      channel_name = channel_name[1..-1] if channel_name.first == '#'
      channel_name = channel_name.sub('-','_')
      channel_name = channel_name.downcase
      channel_name
    end

    private

    def notifier(sender)
      Slack::Notifier.new(Slackit.webhook_url, channel: "##{@channel_name}", username: sender || @default_sender, format_message: default_format )
    end

    def default_format
      {
        formats: [
          :html
        ]
      }
    end
  end
end
