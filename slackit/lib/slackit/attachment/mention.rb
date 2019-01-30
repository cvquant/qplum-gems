module Slackit
  module Attachment
    class Mention

      attr_accessor :name

      def initialize(name)
        @name = name
        self
      end

      def formatted
        "<@#{@name}>"
      end

    end
  end
end
