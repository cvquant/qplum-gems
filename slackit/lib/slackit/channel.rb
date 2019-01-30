module Slackit
  class Channel

    attr_accessor :channel_name, :default_color, :default_sender

    def initialize(channel_name, default_sender, default_color)
      @channel_name = channel_name
      @default_color = default_color
      @default_sender = default_sender
    end

    def send_to_channel(attachment, sender)
      attachment.merge({ color: @default_color })
      notifier(sender).ping '', attachments: [attachment]
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
