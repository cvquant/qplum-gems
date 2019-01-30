module Slackit
  class Message

    attr_accessor :text, :fields, :tables, :mentions, :color, :sender, :pretext

    def initialize(text="")
      @text = text
      @fields = []
      @tables = []
      @mentions = []
      self
    end

    def add_fields(fields)
      fields.each{ |k,v| add_field(k,v) }
      self
    end

    def add_field(key, value)
      @fields << {
        title: "#{key.to_s.titleize}",
        value: "_#{value}_",
        short: true
      }
      self
    end

    def set_color(color)
      @color = color
      self
    end

    def from(sender)
      @sender = sender
      self
    end

    def attach_table(rows)
      @tables << Attachment::Table.new(rows)
      self
    end

    def mention(names)
      names = [names] if !names.kind_of?(Array)
      names.each{ |name| @mentions << Attachment::Mention.new(name) }
      self
    end

    def attachment
      {
        pretext: "[#{Rails.env.upcase}]",
        text: formatted,
        color: @color,
        fields: @fields,
        mrkdwn_in: [:text, :fields]
      }
    end

    def formatted
      @text + @mentions.map{|mention| mention.formatted }.join('') + @tables.map{|table| table.formatted }.join('')
    end

    def self.define_methods
      Slackit.channels.each do |channel_name, channel|
        self.send(:define_method, "send_to_#{channel_name}") do
          channel.send_to_channel(attachment, @sender)
        end
      end
    end

  end
end
