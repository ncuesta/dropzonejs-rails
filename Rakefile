#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

Bundler::GemHelper.install_tasks

require 'dropzonejs-rails'
require 'open-uri'

desc 'Get latest dropzone js build'
task :get do
  source = "https://raw.github.com/enyo/dropzone/v#{DropzonejsRails::DROPZONE_VERSION}/downloads/dropzone.js"
  target = DropzonejsRails::Engine.root.join('vendor/assets/javascripts/dropzone.js')

  open(target, "w+") { |f| f << open(source).read }
end
