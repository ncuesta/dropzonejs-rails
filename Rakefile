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

namespace :dropzone do
  desc 'Check if there is a more recent version of dropzone js'
  task :check do
    if latest_version != DropzonejsRails::DROPZONE_VERSION
      puts "A new version of dropzone (v#{latest_version}) has been found.\nYou may now run: `rake dropzone:replace` to update it or directly rake dropzone:bump. to replace, commit and release it."
    else
      abort "The bundled version of dropzone (v#{DropzonejsRails::DROPZONE_VERSION}) already is the latest one."
    end
  end

  desc 'Replace latest dropzone js build by most recent'
  task :replace do
    puts "=> Fetching dropzone v#{DropzonejsRails::DROPZONE_VERSION}..."
    download_dropzone_file 'dropzone.js', 'app/assets/javascripts/dropzone.js'
    download_dropzone_file 'basic.css', 'app/assets/stylesheets/dropzone/basic.scss'
    download_dropzone_file 'dropzone.css', 'app/assets/stylesheets/dropzone/dropzone.scss'
    puts " ✔ Fetched"
    version = File.join(File.dirname(__FILE__), 'lib', 'dropzonejs-rails', 'version.rb')

    puts "=> Update dropzonejs-rails version from '#{DropzonejsRails::VERSION}' to '#{new_version}'"
    sed version, {
      /DROPZONE_VERSION\s+=\s+'#{DropzonejsRails::DROPZONE_VERSION}'/ => "DROPZONE_VERSION = '#{latest_version}'",
      /\sVERSION\s+=\s+'#{DropzonejsRails::VERSION}'/ => " VERSION = '#{new_version}'"
    }

    readme = File.join(File.dirname(__FILE__), 'README.md')
    sed readme, { /\*\*Dropzone v#{DropzonejsRails::DROPZONE_VERSION}\*\*/ => "**Dropzone v#{latest_version}**" }
    puts " ✔ Done"
  end

  desc 'Bump the dropzone js version to the latest, commit changes and perform a release'
  task bump: [:check, :replace] do
    puts "=> Commit and release"
    %x{ git add -A . && git commit -m 'rake bump: Version bump' }
    Rake::Task['release'].invoke
    puts " ✔ Done"
  end
end

def download_dropzone_file(source_file, target_file)
  source = "https://raw.githubusercontent.com/enyo/dropzone/v#{DropzonejsRails::DROPZONE_VERSION}/dist/#{source_file}"
  target = DropzonejsRails::Engine.root.join(target_file)

  File.open(target, 'wb+') { |f| f << open(source, 'rb').read }
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
  parts[2] = parts[2].next
  parts.join '.'
end

def latest_version
  Octokit.tags('enyo/dropzone').first.name.gsub(/[^\d\.]/, '')
end
