#!/usr/bin/env ruby 

require 'sinatra'
require 'haml'
require 'puma'
require 'sinatra/config_file'
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
  haml :raw
end
