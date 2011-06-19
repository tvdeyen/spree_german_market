Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_german_market'
  s.version     = '0.50.1'
  s.summary     = 'Makes Spree ready for german market'
  s.required_ruby_version = '>= 1.8.7'
  
  s.authors           = ['Robin Böning', 'Thomas von Deyen']
  s.email             = 'robin@magiclabs.de'
  s.homepage          = 'http://github.com/robinboening/spree_german_market'
  
  s.files         = Dir['LICENSE', 'README.md', 'app/**/*', 'config/**/*', 'lib/**/*', 'db/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'
  
  s.has_rdoc = false
  
  s.add_dependency('spree_core', '>= 0.50.0')
  s.add_dependency('spree_auth', '>= 0.50.0')
end
