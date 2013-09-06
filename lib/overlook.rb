require 'sinatra/base'
require_relative 'overlook/paragraph'
require_relative 'overlook/formatters'

class Torrance < Sinatra::Base
  get '/' do
    'Hello World!'
  end

  get '/:count' do
    s = ''
    params[:count].to_i.times do
      s << Overlook::Paragraph.new.output(Overlook::Formatters::HTML.new)
    end
    s
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
