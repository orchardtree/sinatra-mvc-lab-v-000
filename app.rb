require_relative 'config/environment'

class App < Sinatra::Base
  get '/' do
    erb :user_input
  end
  
  post '/' do
    @piglatinized_text = PigLatinizer.new(params[:user_text])
    erb :results
  end
end