module Slackit
  module Attachment
    class Field

      attr_accessor :key, :value

      def initialize(key, value)
        @key = key
        @value = value
      end

      def formatted
        {
          title: "#{@key.to_s.titleize}",
          value: "_#{@value}_",
          short: true
        }
      end

    end
  end
end
