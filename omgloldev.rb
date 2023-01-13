#!/usr/bin/env ruby

require 'sinatra'
require 'haml'
require 'puma'
require 'sinatra/config_file'
require 'htmlbeautifier'
# require 'sinatra/partial'
set :haml, { escape_html: false }

config_file 'fixtures.yaml'

get '/', { provides: 'html' } do
  haml :index
end

get '/preview', { provides: 'html' } do
  @title = settings.weblog_title
  @separator = settings.separator
  @post_title = settings.post_title
  @display = 'preview'
  @date = settings.date
  haml :template
end

get '/raw', { provides: 'html' } do
  @display = 'raw'
  @state = params['state']
  haml :"_pages/raw"
end

post '/save_template' do
  File.open('configuration/template.html', 'w') do |f|
    f.write params[:html_text]
  end
  redirect '/raw?state=saved'
end
