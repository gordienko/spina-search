# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'spina/search/version'

Gem::Specification.new do |s|
  s.name = 'spina-search'
  s.version = Spina::Search::VERSION
  s.authors = ['Alexey Gordienko']
  s.email = ['alx@anadyr.org']
  s.homepage = 'https://github.com/gordienko/spina-search'
  s.summary = 'Search plugin for Spina'
  s.description = 'Plugin for Spina CMS to include search on your website'
  s.license = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'opensearch-ruby', '~> 2.1'
  s.add_dependency 'pg', '~> 1.2'
  s.add_dependency 'searchkick', '~> 5.3'
  s.add_dependency 'spina', '~> 2.1'
  s.required_ruby_version = '~> 3.2'
  s.metadata['rubygems_mfa_required'] = 'true'
end
