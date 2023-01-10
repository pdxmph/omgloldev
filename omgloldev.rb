#!/usr/bin/env ruby 

require 'sinatra'
require 'haml'
require 'puma'
  
get '/template', :provides => 'html' do
  haml :template
end