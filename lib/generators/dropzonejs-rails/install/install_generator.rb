require 'dropzonejs-rails'
require 'dropzonejs-rails/version'

module DropzonejsRails
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Installs Dropzone JS files (v#{DropzonejsRails::DROPZONE_VERSION}) into the project"
      source_root DropzonejsRails::Engine.root.join('app/assets/javascripts')

      def copy_files
        copy_file 'dropzone.js', 'vendor/assets/javascripts/dropzone.js'
      end
    end
  end
end
