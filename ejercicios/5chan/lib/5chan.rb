require 'rubygems'
require 'bundler'
Bundler.require

require 'yaml'
require "./lib/ooyala_api"
# require './lib/video'
# require './lib/user'
# require './lib/comment'

# Configuracion para el API
config = YAML.load(File.read("#{File.dirname __FILE__}/../config/credentials.yaml"))
api_key = ENV['API_KEY'] || config['api_key']
secret  = ENV['SECRET'] || config['secret']
api = Ooyala::API.new api_key, secret

# Configuracion para la base de datos

DataMapper.finalize
DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite::memory:')

# Rutas
get '/' do
  response = api.get('/v2/assets', {:where => "status='live' AND asset_type='video'"})
  @assets = response['items']

  erb :index
end

get '/assets/:embed_code' do
  params[:embed_code]
end
