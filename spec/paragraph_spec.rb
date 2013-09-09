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
        para     = Paragraph.new new_text, 13
        para.to_s.should =~ t
      end
    end

    describe 'formatted paragraph' do
      it 'should look like an HTML paragraph' do
        @para.output(Formatters::HTML.new).should =~ /^<p>.*<\/p>$/
      end
    end
  end
end