module Overlook
  class BustedChar
    def initialize char, bustedness
      @char       = char
      @bustedness = bustedness

      if rand > (1 - @bustedness)
        apply_styles
        invertcase
      end
    end

    def apply_styles
      @styles = {}
      if rand > (1 - @bustedness)
        @styles['vertical-align'] = "%d%%" % [rand(-15..15)]
      end

      if rand > (1 - @bustedness)
        @styles['font-weight'] = "%d00" % [rand(9)]
      end

      if rand > (1 - @bustedness)
        @styles['letter-spacing'] = "%dpx" % [rand(-2..5)]
      end
    end

    def invertcase
      if rand > (1 - @bustedness)
        c = @char.chr
        if c.match /\p{Lower}/
          @char -= 32
        end

        if c.match /\p{Upper}/
          @char += 32
        end
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
