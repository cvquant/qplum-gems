module Slackit
  module Attachment
    class Table

      attr_accessor :rows

      def initialize(rows)
        @rows = rows
        self
      end

      def formatted
        formatted_message = "\n```"
        formatted_message += get_piped_line(@rows.first, column_widths) + "\n"
        formatted_message += "|" + column_widths.map{|w| (1..w+2).map{ |i| "-"}.join("") + "|" }.join("") + "\n"
        remaining_rows = @rows[1..-1]
        remaining_rows.each do |row|
          formatted_message += get_piped_line(row, column_widths) + "\n"
        end
        formatted_message += '```'
        formatted_message
      end

      private

      def get_piped_line(arr, column_widths)
        piped_line = "|"
        (0..arr.size-1).each{ |i| piped_line += " #{uniform_size(arr[i].to_s, column_widths[i])} |" }
        piped_line
      end

      def uniform_size(string, width)
        while string.size < width
          string += " "
        end
        string
      end

      def column_widths
        @column_widths ||= (0..header_row.size-1).map{ |col_i| @rows.map{ |row| row[col_i].to_s.size }.max }
      end

      def header_row
        @rows.first
      end

    end
  end
end
