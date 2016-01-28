# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'everything/piece/find/version'

Gem::Specification.new do |spec|
  spec.name          = 'everything-piece-find'
  spec.version       = Everything::Piece::Find::VERSION
  spec.authors       = ['Kyle Tolle']
  spec.email         = ['kyle@nullsix.com']

  spec.summary       = %q{A method to find a piece within your `everything` repo.}
  spec.description   = %q{Use in conjunction with `everything-core`.}
  spec.homepage      = 'https://github.com/kyletolle/everything-piece-find'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'everything-core', '~> 0.0.7'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.5'
  spec.add_development_dependency 'rspec', '~> 3.4'
end
