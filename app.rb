require 'oj'
require 'sinatra'
require 'psd_native'
require 'sinatra/cross_origin'

configure do
  enable :cross_origin
end

set :allow_origin, :any
set :allow_methods, [:get, :post, :options]
set :allow_credentials, true
set :max_age, "1728000"
set :expose_headers, ['Content-Type']
set :protection, :except => [:http_origin]

options '/' do
  200
end

post '/', :provides => 'json' do
  content_type :json

  PSD.open(params['psd'][:tempfile]) do |psd|
    Oj.dump(psd.tree.to_hash, mode: :compat)
  end
end
