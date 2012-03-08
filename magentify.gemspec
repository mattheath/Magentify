# -*- encoding: utf-8 -*-
require File.expand_path('../lib/magentify/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Alistair Stead"]
  gem.email         = ["alistair.stead@designdisclosure.com"]
  gem.description   = %q{An extension to Capistrano to deploy Magento. Adding the specific requirements and additional tasks.}
  gem.summary       = %q{Deploying Magento PHP applications with Capistrano.}
  gem.homepage      = "https://github.com/alistairstead/Magentify"
  gem.license       = 'MIT'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "magentify"
  gem.require_paths = ["lib"]
  gem.version       = Magentify::VERSION

  gem.add_dependency 'capistrano', ">= 2.5.10"

end
