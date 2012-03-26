# -*- encoding: utf-8 -*-

class Core < Sinatra::Base
  GITHUB = YAML.load_file(File.join(settings.root, 'config/github_key.yml'))
  Mongoid.load!(File.join(settings.root, 'config/mongoid.yml'))

  set :public_folder, Proc.new { File.join(root, "static") }  
  set :views, settings.root + '/app/views'
  set :slim, :pretty => true
  
  use Rack::Session::Cookie
  use OmniAuth::Builder do
    provider :github, GITHUB['id'], GITHUB['secret'] 
  end
  
  helpers do
    def gravatar email
      if email
        "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}"
      else
        "http://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm"
      end
    end
    
    def we_do
       %w(http://dl.dropbox.com/u/1723713/tdd.gif
          http://dl.dropbox.com/u/1723713/bro.jpg
          http://dl.dropbox.com/u/1723713/rails.png
          http://dl.dropbox.com/u/1723713/ruby.png
          http://dl.dropbox.com/u/1723713/coffeescript.jpg
          http://dl.dropbox.com/u/1723713/github.png
          http://dl.dropbox.com/u/1723713/nginx_main_logo.gif
          http://dl.dropbox.com/u/1723713/girl_coffee.gif)
    end
  end
  
  get '/' do
    @target = Target.first
    @bros = Hacker.all
    slim :home
  end
  
  get '/auth/failure' do
    "Not cool, bro"
  end
  
  get '/auth/github/callback' do
    hacker = Hacker.find_or_initialize_by uid: request.env['omniauth.auth']['uid']
    hacker.name  = request.env['omniauth.auth']['info']['nickname']
    hacker.email = request.env['omniauth.auth']['info']['email']
    hacker.save!

    redirect '/'
  end
end
