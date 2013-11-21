require 'json'
require 'sinatra'
require 'haml'
require 'psd'

get '/', :provides => 'html' do
  haml :index
end

post '/', :provides => 'json' do
  PSD.open(params['psd'][:tempfile]) do |psd|
    return psd.tree.to_hash.to_json
  end
end
