module Overlook
  class Paragraph < Array
    attr_accessor :bustedness

    def initialize text = 'All work and no play makes Jack a dull boy.', sentences = 20, bustedness = 0.1
      @text          = text
      @count         = sentences
      @bustedness = bustedness
      self.sentences = sentences
    end

    def text= t
      @text          = t
      self.sentences = @count
    end

    def sentences= n
      @count = n
      self.clear
      @count.times do
        self << @text
      end
    end

    def output formatter
      formatter.output self
    end

    def to_s
      self.join " "
    end
  end
end