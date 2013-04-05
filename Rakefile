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
  download_dropzone_file 'dropzone.js', 'vendor/assets/javascripts/dropzone.js'
  download_dropzone_file 'css/basic.css', 'vendor/assets/stylesheets/dropzone/basic.css.scss'
  download_dropzone_file 'css/dropzone.css', 'vendor/assets/stylesheets/dropzone/dropzone.css.scss'
  download_dropzone_file 'images/spritemap.png', 'vendor/assets/images/dropzone/spritemap.png'
  download_dropzone_file 'images/spritemap@2x.png', 'vendor/assets/images/dropzone/spritemap@2x.png'

  fix_image_links 'vendor/assets/stylesheets/dropzone/basic.css.scss'
  fix_image_links 'vendor/assets/stylesheets/dropzone/dropzone.css.scss'
end

def download_dropzone_file(source_file, target_file)
  source = "https://raw.github.com/enyo/dropzone/v#{DropzonejsRails::DROPZONE_VERSION}/downloads/#{source_file}"
  target = DropzonejsRails::Engine.root.join(target_file)

  File.open(target, 'wb+') { |f| f << open(source, 'rb').read }
end

def fix_image_links(css_file)
  file_name = DropzonejsRails::Engine.root.join(css_file)
  original_css = File.read(file_name)
  fixed_css = original_css.gsub(/url\(\"\.\.\/images\/(.+\.png)\"\)/, 'image-path("dropzone/\1")')
  File.open(file_name, "w") {|file| file << fixed_css}
end
