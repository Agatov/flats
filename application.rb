require 'sinatra/base'
require 'sinatra/assetpack'
require 'haml'
require 'sass'
require 'httparty'
require 'json'
require 'pony'
require 'i18n'


I18n.load_path += Dir[File.join(File.dirname(__FILE__), 'config', 'locales', '*.yml').to_s]

class Application < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :sass, { :load_paths => [ "#{Application.root}/assets/stylesheets" ] }
  set :protection, :except => :frame_options

  register Sinatra::AssetPack

  assets {
    serve '/css', from: 'assets/stylesheets'
    serve '/images', from: 'assets/images'
    serve '/js', from: 'assets/javascripts'
    serve '/fonts', from: 'assets/fonts'

    css :application, '/css/application.css', %w(/css/reset.css /css/index.css /css/intro.css /css/form.css /css/modal.css /css/lightbox.css)
    js :application, '/js/application.js', %w( /js/jquery-1.11.0.min.js /js/initializer.js /js/form.js /js/lightbox.min.js /js/map.js)

    css_compression :sass
    js_compression :jsmin
  }

  get '/' do
    haml :index
  end

  get '/public/topsalon_plan_razvitiya.pdf' do
    send_file File.join('public', 'topsalon_plan_razvitiya.pdf')
  end

  post '/orders.json' do

    content_type :json
    {status: :success}.to_json
  end
end