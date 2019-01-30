module Slackit
  class Message

    attr_accessor :text, :pretext, :fields, :tables, :mentions, :color, :sender

    def initialize(text="")
      @text = text
      @fields = []
      @tables = []
      @mentions = []
      self
    end

    def add_pretext(pretext)
      @pretext = pretext

    end

    def add_fields(fields)
      fields.each{ |k,v| add_field(k,v) }
      self
    end

    def add_field(key, value)
      @fields << Attachment::Field.new(key, value)
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
        pretext: nil,
        text: formatted_text,
        color: @color,
        fields: formatted_fields,
        mrkdwn_in: [:text, :fields]
      }
    end

    def formatted_text
      @text + @mentions.map{ |mention| mention.formatted }.join('') + @tables.map{ |table| table.formatted }.join('')
    end

    def formatted_fields
      @fields.map{ |field| field.formatted }
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
