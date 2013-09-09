require 'sinatra/base'
require_relative 'overlook/paragraph'
require_relative 'overlook/formatters'
require_relative 'overlook/busted_char'

class Torrance < Sinatra::Base
  get '/' do
    redirect to '/1'
  end

  get '/:count' do
    s = ''
    params[:count].to_i.times do
      s << Overlook::Paragraph.new.output(Overlook::Formatters::Busted.new)
    end
    s
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
