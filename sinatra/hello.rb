require 'rubygems'
require 'sinatra'

class MyApp < Sinatra::Base
  get '/' do
    return 'Hello World!'
  end
end
