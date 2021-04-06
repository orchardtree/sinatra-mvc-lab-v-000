require_relative 'config/environment'

class App < Sinatra::Base
  get '/' do
    erb :index
  end
  
  post '/' do
    @piglatinized_text = PigLatinizer.new
    erb :results
  end
end