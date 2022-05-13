$:.push File.expand_path('../lib', __FILE__)

require 'dropzonejs-rails/version'

Gem::Specification.new do |s|
  s.name        = 'dropzonejs-rails'
  s.version     = DropzonejsRails::VERSION
  s.authors     = ['José Nahuel Cuesta Luengo']
  s.email       = ['nahuelcuestaluengo@gmail.com']
  s.homepage    = 'https://www.github.com/ncuesta/dropzonejs-rails'
  s.summary     = 'Integrates Dropzone JS File upload into Rails Asset pipeline.'
  s.description = 'Adds Dropzone, a great JS File upload by Matias Meno, to the Rails Asset pipeline.'

  s.files = Dir["{lib,app}/**/*"] + ['LICENSE', 'Rakefile', 'README.md']

  s.add_development_dependency 'octokit', '~> 4.0'
  s.add_development_dependency 'faraday', '>= 0.9'

  s.add_dependency 'railties', '> 3.1'
end
