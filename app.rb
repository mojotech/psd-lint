require 'sinatra'
require 'haml'
require 'psd'

get '/', :provides => 'html' do
  haml :index
end
