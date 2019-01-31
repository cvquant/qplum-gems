module Slackit
  class Message

    SEND_TO_PREFIX = "send_to_"

    attr_accessor :text, :pretext, :fields, :tables, :mentions, :color, :sender

    def initialize(text="")
      @text = text
      @fields = []
      @tables = []
      @mentions = []
    end

    def add_pretext(pretext)
      @pretext = pretext
      self
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
        pretext: @pretext,
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

    def method_missing(m, *args, &block)
      method_name = m.to_s
      if method_name.start_with?(SEND_TO_PREFIX) && method_name.size > SEND_TO_PREFIX.size
        channel_name = method_name[SEND_TO_PREFIX.size..-1]
        if Slackit.channels.key?(channel_name)
          Slackit.channels[channel_name].send_to_channel(attachment, @sender)
        else
          raise Exception::UnknownChannelException.new("channel #{channel_name} is unknown to Slackit.")
        end
      else
        super
      end
    end

  end
end
