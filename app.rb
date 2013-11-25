require 'oj'
require 'sinatra'
require 'psd_native'

post '/', :provides => 'json' do
  content_type :json

  PSD.open(params['psd'][:tempfile]) do |psd|
    Oj.dump(psd.tree.to_hash, mode: :compat)
  end
end
