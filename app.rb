require_relative 'config/environment'

class App < Sinatra::Base
  get '/' do
    erb :user_input
  end
  
  get '/piglatinize' do
    erb :PigLatinize
  end
  
  post '/piglatinize' do
    @piglatin = PigLatinizer.new.piglatinize(params[:user_phrase])
    erb :piglatinize
    redirect "/piglatinize"
  end
end