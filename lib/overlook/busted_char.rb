module Overlook
  class BustedChar
    def initialize char, bustedness
      @char       = char
      @bustedness = bustedness

      if rand > (1 - @bustedness)
        apply_styles @char
      end
    end

    def apply_styles char
      @styles = {}
      if rand > (1 - @bustedness)
        @styles['vertical-align'] = "%d%%" % [rand(-15..15)]
      end

      if rand > (1 - @bustedness)
        @styles['font-weight'] = "%d00" % [rand(9)]
      end

      if rand > (1 - @bustedness)
        @styles['letter-spacing'] = "%dpx" % [rand(-1..3)]
      end
    end

    def output
      if @styles && @styles.length > 0
        s = '<span style="'
        @styles.each_pair do |k, v|
          s << "%s: %s; " % [
              k,
              v
          ]
        end
        s << '">'

        s << @char
        s << '</span>'

        s
      else
        @char
      end
    end
  end
end