#!/usr/bin/env ruby 

require 'sinatra'
require 'haml'
require 'puma'
require 'sinatra/config_file'

config_file 'fixtures.yaml'

get '/', :provides => 'html' do 
  haml :index
end
  
get '/preview', :provides => 'html' do
  @title = settings.weblog_title
  @separator = settings.separator
  @post_title = settings.post_title
  @display_type = "preview"
  @date = settings.date
  haml :template
end

get '/raw', :provides => 'html' do 
  @display_type="raw"
end 
