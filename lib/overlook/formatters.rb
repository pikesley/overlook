module Overlook
  module Formatters
    class HTML
      def output para
        '<p>%s</p>' % [
            para.join(' ')
        ]
      end
    end
  end
end