
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cfdi/sat/parser/version'

Gem::Specification.new do |spec|
  spec.name          = 'cfdi-sat-parser'
  spec.version       = Cfdi::Sat::Parser::VERSION
  spec.authors       = ['Angel Buzany']
  spec.email         = ['angelbuzany@gmail.com']

  spec.summary       = 'Esta gema parsea a un hash los CFDI (facturas) del SAT'
  spec.description   = 'La idea principal de esta gema es ayudar con a los desarrolladores a parsear los CFDI'\
                       'que estan en formato XMl a un HASH para gilizar el proceso de desarrollo.'
  spec.homepage      = 'https://github.com/abuzzany/cfdi-sat-parser'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
