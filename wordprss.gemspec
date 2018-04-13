lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wordprss/version'

Gem::Specification.new do |s|
  s.add_runtime_dependency 'rest-client', '2.0.2'
  s.add_runtime_dependency 'nokogiri', '1.8.2'
  s.add_development_dependency "rspec"
  s.name        = 'wordprss'
  s.version     = WordpRSS::Version
  s.date        = '2018-04-13'
  s.summary     = "Access the RSS channel of any Wordpress blog"
  s.description = "Access the RSS channel of any Wordpress blog"
  s.authors     = ["Paweł Dąbrowski"]
  s.email       = 'dziamber@gmail.com'
  s.files       = Dir['lib/**/*.rb']
  s.homepage    =
    'http://github.com/rubyhero/wordprss'
  s.license       = 'MIT'
end
