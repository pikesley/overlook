class Paragraph < Array
  def initialize text = 'All work and no play makes Jack a dull boy.', sentences = 20
    @text          = text
    @count         = sentences
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

  def to_s
    self.join " "
  end
end