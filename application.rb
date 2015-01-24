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

  get '/public/presentation.pdf' do
    send_file File.join('public', 'presentation.pdf')
  end

  get '/public/svidetelstvo.pdf' do
    send_file File.join('public', 'svidetelstvo.pdf')
  end

  get '/public/razreshenie.pdf' do
    send_file File.join('public', 'razreshenie.pdf')
  end

  get '/public/ekspertiza.pdf' do
    send_file File.join('public', 'ekspertiza.pdf')
  end

  get '/public/declaraciya.pdf' do
    send_file File.join('public', 'declaraciya.pdf')
  end

  
  post '/orders.json' do

    message = "#{params[:order][:username]}. #{params[:order][:phone]}"

    Pony.mail ({
      to: 'sales@ostrinskiy.ru, abardacha@gmail.com',
      subject: I18n.t('email.title', locale: 'ru'),
      body: message,
      via: :smtp,
      via_options: {
        address: 'smtp.gmail.com',
        port: 587,
        enable_starttls_auto: true,
        user_name: 'ostrinsky.notifier@gmail.com',
        password: 'qwe123rt',
        authentication: :plain
      }
    })

    content_type :json
    {status: :success}.to_json
  end
end