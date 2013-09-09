require_relative 'busted_char'

module Overlook
  module Formatters
    class HTML
      def output para
        '<p>%s</p>' % [
            para.join(' ')
        ]
      end
    end

    class Busted
      def bustify para
        p = []
        para.each do |line|
          s = ''
          line.each_byte do |char|
            if rand > (1 - para.bustedness)
              c = Overlook::BustedChar.new char, para.bustedness
              s << c.output
            else
              s << char
            end
          end

          p << s
        end

        p
      end

      def output para
        para = bustify para
        HTML.new.output para
      end
    end
  end
end