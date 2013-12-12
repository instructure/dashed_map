# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = 'dashed_map'
  s.version = '0.0.1'
  s.summary = 'Everyone could use some dashed_map'
  s.description = 'Accepts an array of words and returns an array of words, some of them combined by a dash.'

  s.required_ruby_version     = '>= 1.9.3'
  s.required_rubygems_version = '>= 1.3.5'

  s.authors           = ['Instructure']
  s.license           = 'MIT'
  s.homepage          = 'http://github.com/instructure/dashed_map'

  s.files = %w(LICENSE.txt README.md) + Dir['lib/**/*.rb']
end
