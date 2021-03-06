require 'spec_helper'

module Overlook
  describe Paragraph do
    before :each do
      @para         = Paragraph.new
      @default_text = 'All work and no play makes Jack a dull boy.'
    end

    describe 'unadorned paragraph' do
      it 'should return the default sentence' do
        @para.to_s.should =~ /#{@default_text}/
      end

      it 'should default to having 20 sentences' do
        t = make_paragraph @default_text, 20
        @para.to_s.should =~ t
      end

      it 'should allow us to change the number of sentences' do
        t               = make_paragraph @default_text, 7
        @para.sentences = 7
        @para.to_s.should =~ t
      end

      it 'should allow us to change the text' do
        new_text   = 'This is a different sentence.'
        t          = make_paragraph new_text, 20
        @para.text = new_text
        @para.to_s.should =~ t
      end

      it 'should allow us to change both' do
        new_text        = 'The government is spying on you.'
        t               = make_paragraph new_text, 8
        @para.text      = new_text
        @para.sentences = 8
        @para.to_s.should =~ t
      end

      it 'should take custom initialisation values' do
        new_text = 'I got a letter from the Government, the other day.'
        t        = make_paragraph new_text, 12
        para     = Paragraph.new new_text, 12
        para.to_s.should =~ t
      end
    end

    describe 'formatted paragraph' do
      it 'should look like an HTML paragraph' do
        @para.output(Formatters::HTML.new).should =~ /^<p>.*<\/p>$/
      end
    end

    describe 'busted paragraph' do
      it 'should look like an HTML paragraph' do
        @para.output(Formatters::Busted.new).should =~ /^<p>.*<\/p>$/
      end

      it 'should have configurable bustedness' do
        @para.bustedness = 0.7
        @para.bustedness.should == 0.7
      end

      it 'should have styled spans' do
        @para.bustedness = 1
        @para.output(Formatters::Busted.new).should =~ /<span style="/
      end

      it 'should not have any empty styles' do
        @para.bustedness = 0.5
        @para.output(Formatters::Busted.new).should_not =~ /<span style="">/
      end

      it 'should have vertical-align set' do
        @para.bustedness = 1
        @para.output(Formatters::Busted.new).should =~ /<span style="[^>]*vertical-align: -?[0-9]*%; /
      end

      it 'should have font-weight set' do
        @para.bustedness = 1
        @para.output(Formatters::Busted.new).should =~ /<span style="[^>]*font-weight: [0-9]00; /
      end

      it 'should have letter-spacing set' do
        @para.bustedness = 1
        @para.output(Formatters::Busted.new).should =~ /<span style="[^>]*letter-spacing: -?[0-9]*px; /
      end

      it 'should invert case' do
        @para.bustedness = 1
        @para.sentences = 1
#        @para.output(Formatters::Busted.new).should =~ /<p>aLL WORK.*jACK<\/p>/
        @para.output(Formatters::Busted.new).should =~ /<p><span[^>]*>a<\/span><span[^>]*>L<\/span><span[^>]*>L<\/span>/
        @para.output(Formatters::Busted.new).should =~ /<span[^>]*>j<\/span><span[^>]*>A<\/span><span[^>]*>C<\/span><span[^>]*>K<\/span>/
      end
    end
  end
end