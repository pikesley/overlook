require 'sinatra/base'
require 'overlook/paragraph'

class Torrance < Sinatra::Base
  get '/' do
    'Hello World!'
  end

  get '/:count' do
    s = ''
    params[:count].to_i.times do
      s << Overlook::Paragraph.new.to_s
    end

    s
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
