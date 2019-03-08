# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shopify_api_extensions/version'

Gem::Specification.new do |spec|
  spec.name          = "shopify_api_extensions"
  spec.version       = ShopifyAPIExtensions::VERSION
  spec.authors       = ["Michael Bianco"]
  spec.email         = ["mike@cliffsidemedia.com"]

  spec.summary       = %q{Pagination, backoff, and other extensions to the shopify ruby API}
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/iloveitaly/shopify_api_extensions"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'shopify_api', '~> 4.7'

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
