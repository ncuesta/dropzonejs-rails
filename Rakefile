#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

Bundler::GemHelper.install_tasks

require 'open-uri'
require 'octokit'
require 'dropzonejs-rails'

desc 'Get latest dropzone js build'
task :get do
  puts "Fetching dropzone v#{DropzonejsRails::DROPZONE_VERSION}..."

  download_dropzone_file 'dropzone.js', 'vendor/assets/javascripts/dropzone.js'
  download_dropzone_file 'css/basic.css', 'vendor/assets/stylesheets/dropzone/basic.css.scss'
  download_dropzone_file 'css/dropzone.css', 'vendor/assets/stylesheets/dropzone/dropzone.css.scss'
  download_dropzone_file 'images/spritemap.png', 'vendor/assets/images/dropzone/spritemap.png'
  download_dropzone_file 'images/spritemap@2x.png', 'vendor/assets/images/dropzone/spritemap@2x.png'

  puts "Fixing image paths..."
  fix_image_links 'vendor/assets/stylesheets/dropzone/basic.css.scss'
  fix_image_links 'vendor/assets/stylesheets/dropzone/dropzone.css.scss'

  puts "Done"
end

desc 'Find the latest dropzone js version and get it'
task :check do
  latest_version = Octokit.tags('enyo/dropzone').first.name.gsub(/[^\d\.]/, '')

  if latest_version != DropzonejsRails::DROPZONE_VERSION
    version = File.join(File.dirname(__FILE__), 'lib', 'dropzonejs-rails', 'version.rb')
    sed version, {
      /DROPZONE_VERSION\s+=\s+'#{DropzonejsRails::DROPZONE_VERSION}'/ => "DROPZONE_VERSION = '#{latest_version}'",
      /\sVERSION\s+=\s+'#{DropzonejsRails::VERSION}'/ => " VERSION = '#{new_version}'"
    }

    readme = File.join(File.dirname(__FILE__), 'README.md')
    sed readme, { /\*\*Dropzone v#{DropzonejsRails::DROPZONE_VERSION}\*\*/ => "**Dropzone v#{latest_version}**" }

    puts "A new version of dropzone (v#{latest_version}) has been found, and the source files have been accordingly updated.\nYou may now run: `rake get` to get it."
  else
    raise "The bundled version of dropzone (v#{DropzonejsRails::DROPZONE_VERSION}) already is the latest one."
  end
end

desc 'Bump the dropzone js version to the latest, commit changes and perform a release'
task bump: [:check, :get] do
  %x{ git add -A . && git commit -m 'rake bump: Version bump' }
  Rake::Task['release'].invoke
end

def download_dropzone_file(source_file, target_file)
  source = "https://raw.github.com/enyo/dropzone/v#{DropzonejsRails::DROPZONE_VERSION}/downloads/#{source_file}"
  target = DropzonejsRails::Engine.root.join(target_file)

  File.open(target, 'wb+') { |f| f << open(source, 'rb').read }
end

def fix_image_links(css_file)
  file_name    = DropzonejsRails::Engine.root.join(css_file)
  original_css = File.read(file_name)
  fixed_css    = original_css.gsub(/url\(\"\.\.\/images\/(.+\.png)\"\)/, 'image-url("dropzone/\1")')

  File.open(file_name, 'w') { |file| file << fixed_css }
end

def sed(filename, replacements)
  contents = File.read(filename)
  replacements.each_pair do |pattern, replacement|
     contents.gsub!(pattern, replacement)
  end
  File.write filename, contents
end

def new_version
  parts = DropzonejsRails::VERSION.split('.')
  parts[2] = parts[2].to_i + 1
  parts.join '.'
end
