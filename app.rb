require 'json'
require 'sinatra'
require 'haml'
require 'psd'

get '/', :provides => 'html' do
  haml :index
end

get '/grade', :provides => 'html' do
  haml :grade
end

post '/', :provides => 'html' do
  PSD.open(params['psd'][:tempfile]) do |psd|
    @tree = psd.tree.to_hash
    haml :grade
  end
end
